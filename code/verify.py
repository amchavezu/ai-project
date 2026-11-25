"""Symbolic and numerical checks for the access-cost threshold model.

The script is intentionally independent of the Lean proof. It verifies the
threshold, closed-form policy, local comparative statics, numerical table, and
illustrative sectoral exercises reported in the paper and final slides. It
writes the checked values to ``code/output/model_checks.csv`` and the simulated
policy curve to ``code/output/access_curve.csv``. The final paper's three
PGFPlots/TikZ figures use the same checked parameterization.
"""

from __future__ import annotations

import math
import csv
from pathlib import Path

import sympy as sp


BASE = {
    "beta": 0.95,
    "a": 2.0,
    "c": 0.5,
    "n": 0.4,
    "bbar": 0.5,
    "r_b": 0.5,
}


def production(k: float, a: float, c: float) -> float:
    return a * k - c * k**2 / 2


def threshold(params: dict[str, float]) -> float:
    cap = params["n"] + params["bbar"]
    return params["beta"] * (params["a"] - params["c"] * cap) - params["r_b"]


def market_target(tau: float, params: dict[str, float]) -> float:
    return (
        params["beta"] * params["a"] - params["r_b"] - tau
    ) / (params["beta"] * params["c"])


def optimal_capital(tau: float, params: dict[str, float]) -> float:
    cap = params["n"] + params["bbar"]
    return max(cap, market_target(tau, params))


def symbolic_checks() -> None:
    beta, a, c, r_b, n, bbar, k, tau, delta = sp.symbols(
        "beta a c R_B n bbar k tau delta", positive=True
    )
    output = a * k - c * k**2 / 2
    cap = n + bbar
    r_m = r_b + tau
    bank_profit = beta * output - r_b * (k - n)
    market_profit = (
        beta * output - r_b * bbar - r_m * (k - n - bbar)
    )

    k_b = sp.simplify((beta * a - r_b) / (beta * c))
    k_m = sp.simplify((beta * a - r_m) / (beta * c))
    tau_star = sp.simplify(beta * (a - c * cap) - r_b)

    assert sp.simplify(sp.diff(bank_profit, k).subs(k, k_b)) == 0
    assert sp.simplify(sp.diff(market_profit, k).subs(k, k_m)) == 0
    assert sp.simplify(sp.diff(bank_profit, k, 2)) == -beta * c
    assert sp.simplify(sp.diff(market_profit, k, 2)) == -beta * c
    assert sp.simplify(k_m.subs(tau, tau_star) - cap) == 0
    assert sp.simplify(k_m - cap - (tau_star - tau) / (beta * c)) == 0
    assert sp.simplify(sp.diff(k_m, tau) + 1 / (beta * c)) == 0

    shifted_target = (beta * a - (r_b + tau + delta)) / (beta * c)
    assert sp.simplify(shifted_target - (k_m - delta / (beta * c))) == 0

    x = sp.symbols("x", real=True)
    f = lambda q: a * q - c * q**2 / 2
    increment = sp.expand(f(x + delta) - f(x))
    expected = sp.expand(delta * (a - c * x) - c * delta**2 / 2)
    assert sp.simplify(increment - expected) == 0


def numerical_checks() -> dict[str, float]:
    beta = BASE["beta"]
    a = BASE["a"]
    c = BASE["c"]
    n = BASE["n"]
    bbar = BASE["bbar"]
    r_b = BASE["r_b"]
    tau_expensive = 1.10
    tau_affordable = 0.90
    access_cost_shock = 0.02
    ceiling_shock = 0.10

    f = lambda q: a * q - c * q**2 / 2
    cap = n + bbar
    k_b = (beta * a - r_b) / (beta * c)
    tau_star = beta * (a - c * cap) - r_b
    k_m_affordable = (beta * a - r_b - tau_affordable) / (beta * c)
    k_m_at_threshold = (beta * a - r_b - tau_star) / (beta * c)

    assert 0 < tau_affordable < tau_star < tau_expensive
    assert cap < k_m_affordable < k_b
    assert math.isclose(k_m_at_threshold, cap)

    expensive_k = cap
    affordable_k = k_m_affordable
    affordable_extra_capital = affordable_k - cap
    closed_form_extra_capital = (tau_star - tau_affordable) / (beta * c)
    assert math.isclose(affordable_extra_capital, closed_form_extra_capital)
    affordable_output_gain = f(affordable_k) - f(cap)
    closed_form_output_gain = (
        affordable_extra_capital * (a - c * cap)
        - c * affordable_extra_capital**2 / 2
    )
    assert affordable_output_gain > 0
    assert math.isclose(affordable_output_gain, closed_form_output_gain)
    expensive_after_ceiling = cap + ceiling_shock
    affordable_after_ceiling = affordable_k
    affordable_after_access_shock = (
        beta * a - r_b - tau_affordable - access_cost_shock
    ) / (beta * c)
    expensive_after_access_shock = expensive_k

    tau_star_after_ceiling = beta * (a - c * (cap + ceiling_shock)) - r_b
    assert tau_expensive > tau_star_after_ceiling
    assert tau_affordable < tau_star_after_ceiling
    assert affordable_after_access_shock > cap
    assert expensive_after_ceiling < k_b

    def uniform_survival(x: float, lower: float, upper: float) -> float:
        if x <= lower:
            return 1.0
        if x >= upper:
            return 0.0
        return (upper - x) / (upper - lower)

    constrained_share_n = uniform_survival(tau_star, 0.8, 1.2)
    constrained_share_t = uniform_survival(tau_star, 0.6, 1.0)
    assert constrained_share_n > constrained_share_t >= 0

    bbar_shift = {**BASE, "bbar": 0.65}
    a_shift = {**BASE, "a": 2.15}
    c_shift = {**BASE, "c": 0.65}
    assert threshold(bbar_shift) < threshold(BASE)
    assert threshold(a_shift) > threshold(BASE)
    assert threshold(c_shift) < threshold(BASE)
    assert 1 / (c_shift["beta"] * c_shift["c"]) < 1 / (beta * c)

    sector_n = {**BASE, "beta": 0.92}
    sector_t = {**BASE, "beta": 0.98}
    tau_n = 1.05
    tau_t = 0.80
    k_n = optimal_capital(tau_n, sector_n)
    k_t = optimal_capital(tau_t, sector_t)
    y_n = production(k_n, a, c)
    y_t = production(k_t, a, c)
    assert tau_n >= threshold(sector_n)
    assert math.isclose(k_n, cap)
    assert tau_t < threshold(sector_t)
    assert k_t > cap
    assert y_t > y_n

    return {
        "bank_target": k_b,
        "bank_ceiling_capital": cap,
        "access_cost_threshold": tau_star,
        "market_target_at_threshold": k_m_at_threshold,
        "expensive_access_wedge": tau_expensive,
        "expensive_access_capital": expensive_k,
        "expensive_access_output": f(expensive_k),
        "affordable_access_wedge": tau_affordable,
        "affordable_access_capital": affordable_k,
        "affordable_access_output": f(affordable_k),
        "affordable_extra_capital": affordable_extra_capital,
        "affordable_output_gain": affordable_output_gain,
        "expensive_capital_after_ceiling_shock": expensive_after_ceiling,
        "affordable_capital_after_ceiling_shock": affordable_after_ceiling,
        "expensive_capital_after_access_cost_shock": expensive_after_access_shock,
        "affordable_capital_after_access_cost_shock": affordable_after_access_shock,
        "affordable_output_after_access_cost_shock": f(
            affordable_after_access_shock
        ),
        "illustrative_constrained_share_nontradable": constrained_share_n,
        "illustrative_constrained_share_tradable": constrained_share_t,
        "nontradable_discount_factor": sector_n["beta"],
        "nontradable_access_wedge": tau_n,
        "nontradable_threshold": threshold(sector_n),
        "nontradable_capital_at_t": k_n,
        "nontradable_output_at_t_plus_1": y_n,
        "tradable_discount_factor": sector_t["beta"],
        "tradable_access_wedge": tau_t,
        "tradable_threshold": threshold(sector_t),
        "tradable_capital_at_t": k_t,
        "tradable_output_at_t_plus_1": y_t,
    }


def write_access_curve(output_dir: Path) -> None:
    beta = BASE["beta"]
    a = BASE["a"]
    c = BASE["c"]
    n = BASE["n"]
    bbar = BASE["bbar"]
    r_b = BASE["r_b"]
    cap = n + bbar

    curve_path = output_dir / "access_curve.csv"
    with curve_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["tau", "optimal_capital", "output", "regime"])
        for step in range(61):
            tau = 0.6 + step * 0.01
            market_target = (beta * a - r_b - tau) / (beta * c)
            optimal_capital = max(cap, market_target)
            regime = "alternative_finance" if market_target > cap else "bank_limit"
            output = a * optimal_capital - c * optimal_capital**2 / 2
            writer.writerow(
                [
                    f"{tau:.2f}",
                    f"{optimal_capital:.9f}",
                    f"{output:.9f}",
                    regime,
                ]
            )


def main() -> None:
    symbolic_checks()
    results = numerical_checks()
    output_dir = Path(__file__).resolve().parent / "output"
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / "model_checks.csv"
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["quantity", "checked_value"])
        for key, value in results.items():
            if not math.isfinite(value):
                raise ValueError(f"Non-finite result: {key}={value}")
            writer.writerow([key, f"{value:.9f}"])

    write_access_curve(output_dir)

    print("All symbolic and numerical checks passed.\n")
    for key, value in results.items():
        print(f"{key}: {value:.6f}")
    print(f"\nWrote {output_path}")
    print(f"Wrote {output_dir / 'access_curve.csv'}")


if __name__ == "__main__":
    main()
