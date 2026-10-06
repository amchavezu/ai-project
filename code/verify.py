"""Symbolic and numerical checks for the credit-transmission model.

The script is intentionally independent of the Lean proof. It verifies the
closed forms, regime inequalities, numerical table, and sectoral derivatives
reported in ``paper/paper.tex``. It also writes the checked values to
``code/output/model_checks.csv``.
"""

from __future__ import annotations

import math
import csv
from pathlib import Path
import sympy as sp


def symbolic_checks() -> None:
    beta, a, c, r_b, r_m, n, bbar, k, delta = sp.symbols(
        "beta a c R_B R_M n bbar k delta", positive=True
    )
    output = a * k - c * k**2 / 2
    bank_profit = beta * output - r_b * (k - n)
    market_profit = (
        beta * output - r_b * bbar - r_m * (k - n - bbar)
    )

    k_b = sp.simplify((beta * a - r_b) / (beta * c))
    k_m = sp.simplify((beta * a - r_m) / (beta * c))

    assert sp.simplify(sp.diff(bank_profit, k).subs(k, k_b)) == 0
    assert sp.simplify(sp.diff(market_profit, k).subs(k, k_m)) == 0
    assert sp.simplify(sp.diff(bank_profit, k, 2)) == -beta * c
    assert sp.simplify(sp.diff(market_profit, k, 2)) == -beta * c

    shifted_target = (beta * a - (r_m + delta)) / (beta * c)
    assert sp.simplify(shifted_target - (k_m - delta / (beta * c))) == 0

    x = sp.symbols("x", real=True)
    f = lambda q: a * q - c * q**2 / 2
    increment = sp.expand(f(x + delta) - f(x))
    expected = sp.expand(delta * (a - c * x) - c * delta**2 / 2)
    assert sp.simplify(increment - expected) == 0


def numerical_checks() -> dict[str, float]:
    beta = 0.95
    a = 2.0
    c = 0.5
    n = 0.4
    bbar = 0.5
    r_b = 0.5
    r_m = 1.4
    spread_shock = 0.02
    ceiling_shock = 0.10

    f = lambda q: a * q - c * q**2 / 2
    cap = n + bbar
    k_b = (beta * a - r_b) / (beta * c)
    k_m = (beta * a - r_m) / (beta * c)

    assert cap < k_m < k_b

    constrained_k = cap
    market_k = k_m
    constrained_after_ceiling = cap + ceiling_shock
    market_after_ceiling = market_k
    market_after_spread = (beta * a - (r_m + spread_shock)) / (beta * c)
    constrained_after_spread = constrained_k

    assert market_after_spread > cap  # no regime switch in the experiment
    assert constrained_after_ceiling < k_b

    lambda_n = 0.8
    lambda_t = 0.2
    mp_at_cap = a - c * cap
    price_unit = r_m / (beta**2 * c)
    quantity_n = lambda_n * mp_at_cap
    quantity_t = lambda_t * mp_at_cap
    price_n = (1 - lambda_n) * price_unit
    price_t = (1 - lambda_t) * price_unit

    assert quantity_n > quantity_t > 0
    assert price_t > price_n > 0

    return {
        "bank_target": k_b,
        "market_target": k_m,
        "bank_ceiling_capital": cap,
        "constrained_output": f(constrained_k),
        "market_output": f(market_k),
        "constrained_capital_after_ceiling_shock": constrained_after_ceiling,
        "market_capital_after_ceiling_shock": market_after_ceiling,
        "constrained_capital_after_spread_shock": constrained_after_spread,
        "market_capital_after_spread_shock": market_after_spread,
        "market_output_after_spread_shock": f(market_after_spread),
        "quantity_marginal_nontradable": quantity_n,
        "quantity_marginal_tradable": quantity_t,
        "price_magnitude_nontradable": price_n,
        "price_magnitude_tradable": price_t,
    }


def main() -> None:
    symbolic_checks()
    results = numerical_checks()
    output_path = Path(__file__).resolve().parent / "output" / "model_checks.csv"
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["quantity", "checked_value"])
        for key, value in results.items():
            if not math.isfinite(value):
                raise ValueError(f"Non-finite result: {key}={value}")
            writer.writerow([key, f"{value:.9f}"])

    print("All symbolic and numerical checks passed.\n")
    for key, value in results.items():
        print(f"{key}: {value:.6f}")
    print(f"\nWrote {output_path}")


if __name__ == "__main__":
    main()
