# Modelo v2: límite bancario y costo de acceso a financiamiento alternativo

## Pregunta

**¿Cómo afecta el costo de acceder a financiamiento alternativo la inversión y
la producción de una empresa con crédito bancario limitado?**

## Idea en una frase

Existe un costo umbral. Por encima de ese umbral, la empresa se detiene en su
límite bancario; por debajo, utiliza financiamiento alternativo y expande la
inversión hasta que el retorno marginal iguala su costo marginal.

## Primitivas

- `n > 0`: fondos propios.
- `b`: crédito bancario.
- `B > 0`: límite de crédito bancario.
- `m`: financiamiento alternativo.
- `R_B > 0`: costo marginal bancario.
- `tau >= 0`: costo adicional de acceder a la fuente alternativa.
- `R_M = R_B + tau`: costo marginal del financiamiento alternativo.
- `k = n + b + m`: inversión o capital instalado.
- `F(k)`: producción futura, con `F' > 0` y `F'' < 0`.
- `beta in (0,1]`: factor de descuento.

La empresa resuelve

```text
max beta F(k) - R_B b - (R_B + tau) m
s.a. k = n + b + m, 0 <= b <= B, m >= 0.
```

Como el banco es más barato, la empresa usa primero fondos propios, luego el
banco y finalmente la fuente alternativa.

## Supuesto focal

Definir `k_bar = n + B`. Nos concentramos en empresas para las que la línea
bancaria sería vinculante si no existiera la fuente alternativa:

```text
beta F'(k_bar) > R_B.
```

Este supuesto elimina el caso irrelevante para la pregunta en el que la
empresa ni siquiera desea agotar su línea bancaria.

## Umbral de acceso

En `k_bar`, financiar una unidad adicional cuesta `R_B + tau`. La empresa la
instala si

```text
beta F'(k_bar) > R_B + tau.
```

Por tanto, el costo umbral es

```text
tau_star = beta F'(k_bar) - R_B > 0.
```

## Proposición principal

Bajo concavidad estricta y el supuesto focal:

1. Si `tau >= tau_star`, la fuente alternativa es demasiado costosa y
   `k* = k_bar`. Para cambios pequeños que no crucen el umbral,
   `dk*/dB = 1` y `dk*/dtau = 0`.
2. Si `0 <= tau < tau_star`, la empresa utiliza financiamiento alternativo.
   Su inversión satisface
   `beta F'(k*) = R_B + tau`, con `k* > k_bar`. Localmente,
   `dk*/dB = 0` y `dk*/dtau = 1/[beta F''(k*)] < 0`.

Como `Y = F(k*)`, la producción tiene los mismos signos comparativos.

El resultado es continuo en `tau_star`, pero no diferenciable en el umbral.
Esta no linealidad es una predicción del modelo, no un problema de la solución.

## Especialización cuadrática

Para

```text
F(k) = a k - (c/2) k^2,
```

el umbral y la inversión con financiamiento alternativo son

```text
tau_star = beta[a - c(n+B)] - R_B,
k_M(tau) = [beta a - R_B - tau]/(beta c).
```

Entonces

```text
k*(tau) = max{n+B, k_M(tau)}
```

dentro del dominio focal, y

```text
dk_M/dtau = -1/(beta c).
```

## Extensión sectorial

Las empresas difieren en `tau_i`. En el sector `s`, su distribución es
`G_s(tau)`. La proporción de empresas restringidas surge del modelo:

```text
lambda_s = Pr(tau_i >= tau_star) = 1 - G_s(tau_star).
```

Si la distribución del sector no transable está desplazada hacia costos de
acceso mayores, ese sector tiene una mayor fracción de empresas cuyo capital
está determinado por el límite bancario. La diferencia sectorial se presenta
como aplicación contrastable, no como una equivalencia entre sector y tipo de
empresa.

## Límites interpretativos

- El modelo no demuestra capacidad predictiva ni causalidad.
- El volumen de crédito observado es un proxy imperfecto de `B`.
- El spread observado es un proxy imperfecto de `tau` o `R_B + tau`.
- El modelo estático no genera horizontes de pronóstico.
- La distribución sectorial de `tau` debe disciplinarse con datos.
