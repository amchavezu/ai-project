# Guía de lectura y defensa oral

## La idea en una frase

El crédito puede afectar al producto por dos márgenes distintos: para una
empresa que ya agotó su línea bancaria y no tiene una alternativa marginal
barata, importa **cuánto crédito obtiene**; para una empresa con acceso a
financiamiento externo, importa principalmente **el precio marginal de ese
financiamiento**.

## Qué se toma de la tesis y qué agrega este paper

La tesis todavía está en desarrollo. Su evidencia preliminar sugiere que el
volumen de crédito podría contener más información sobre la actividad no
transable a horizontes relativamente cortos, mientras que el spread podría ser
más informativo para la actividad transable a un horizonte más largo. No se
presentan picos exactos como resultados cerrados. El paper del curso agrega un
modelo que racionaliza por qué los dos indicadores pueden ser informativos para
sectores distintos, sin convertir la predictibilidad en causalidad.

## Firmas y decisiones

Cada empresa empieza con fondos propios `n`, puede usar crédito bancario `b`
hasta una línea máxima `B`, y —si tiene acceso— financiamiento de mercado `m`.
La inversión o capital es `k = n + b + m`. El crédito bancario cuesta `R_B` y
el financiamiento de mercado cuesta `R_M = R_B + tau`, con `tau >= 0`.

La empresa maximiza el valor presente de la producción futura menos los costos
financieros. La producción es cóncava; para obtener soluciones cerradas se usa
`F(k) = a k - (c/2) k^2`.

## Los cuatro casos de la política óptima

Sean

- `k_B = (beta a - R_B)/(beta c)`, el capital deseado si la unidad marginal se
  financia con el banco;
- `k_M = (beta a - R_M)/(beta c)`, el capital deseado si la unidad marginal se
  financia en el mercado;
- `k_bar = n + B`, el capital alcanzable al agotar la línea bancaria.

Entonces:

1. Si `k_B <= n`, la empresa no pide crédito.
2. Si `n < k_B < k_bar`, usa crédito bancario, pero la línea no restringe.
3. Si `k_M <= k_bar <= k_B`, se detiene exactamente en la línea bancaria: es
   el régimen de restricción crediticia vinculante.
4. Si `k_bar < k_M`, agota la línea bancaria y usa financiamiento de mercado:
   el precio marginal determina la inversión total.

## Proposición central

En el régimen vinculante, aumentar `B` eleva el capital uno por uno y aumenta
el producto futuro. Un cambio pequeño del spread no altera la inversión si no
hace que la firma cambie de régimen.

En el régimen de mercado, aumentar `B` solo sustituye deuda de mercado por
deuda bancaria; no cambia el capital total. En cambio, un spread mayor eleva el
costo marginal, reduce el capital deseado y disminuye el producto futuro.

## De firmas a sectores

`lambda_s` es la proporción de firmas del sector `s` que está en el régimen de
cantidad. Si `lambda_N > lambda_T`, porque las firmas no transables dependen
más del banco y acceden menos al mercado, entonces:

- la actividad no transable reacciona más a la disponibilidad de crédito;
- la actividad transable reacciona más, en valor absoluto, al spread.

Este es el puente condicional entre el modelo y el patrón cualitativo que la
tesis está evaluando.

## Qué sí y qué no demuestra

El modelo demuestra signos y rankings sectoriales bajo supuestos claros. No
demuestra causalidad en las regresiones de la tesis ni genera por sí solo
horizontes exactos. La extensión dinámica del paper
escribe la ecuación de Euler y muestra dónde entrarían costos de ajuste,
depreciación, plazos de maduración y el valor sombra de la restricción; esos
elementos servirían para estudiar los horizontes en una segunda versión.

## Cómo presentarlo al profesor

1. Empieza por el hecho empírico de la tesis y di que falta un mecanismo.
2. Dibuja una curva de beneficio marginal decreciente y dos costos marginales:
   `R_B` hasta `k_bar` y `R_M` después.
3. Señala los dos casos importantes: óptimo en el quiebre versus óptimo sobre
   el tramo de mercado.
4. Presenta solo las tres derivadas comparativas de cada caso.
5. Cierra con `lambda_N > lambda_T`, la predicción sectorial y una limitación
   honesta sobre los horizontes.

La pregunta más probable es por qué las transables tienen mejor acceso al
mercado. La respuesta debe presentarse como una hipótesis institucional
contrastable —mayor tamaño, colateral en moneda extranjera, vínculos con grupos
económicos o acceso a deuda externa— y no como un hecho ya probado con la base
actual.
