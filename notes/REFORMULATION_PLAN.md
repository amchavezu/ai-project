# Plan de reformulación para la presentación final

> **Estado:** diagnóstico inicial. La arquitectura aprobada y vigente está en
> `notes/MODEL_V2.md`: una empresa, una cuña continua de acceso `tau`, un umbral
> endógeno `tau_star` y sectores solo como extensión distributiva.

## 1. Diagnóstico

El modelo actual es formalmente defendible, pero la pregunta es más amplia que
lo que el modelo demuestra. La pregunta habla de capacidad predictiva,
diferencias sectoriales y horizontes temporales. El modelo, en cambio, es
estático y demuestra una comparación de estática comparativa entre dos
regímenes de financiamiento.

Los principales puntos de mejora son:

1. **Desalineación entre pregunta y método.** Un modelo determinístico de dos
   fechas no puede demostrar qué variable mejora más un pronóstico ni en qué
   horizonte alcanza su mayor poder predictivo.
2. **Desalineación entre variables empíricas y teóricas.** El modelo usa un
   límite de crédito bancario, mientras la tesis observa volumen de crédito. El
   modelo usa el costo marginal amplio del financiamiento externo, mientras la
   tesis observa un spread bancario. Es necesario presentar las variables
   observadas como proxies, no como los objetos estructurales exactos.
3. **El resultado sectorial está demasiado cerca del supuesto.** Si se supone
   que el sector no transable tiene más firmas restringidas, se obtiene que
   responde más al margen de cantidad. Debe presentarse como corolario
   condicional y predicción contrastable, no como la contribución principal.
4. **Se confunden sectores con tipos de firma.** No toda firma no transable está
   restringida ni toda firma transable accede a financiamiento alternativo. La
   diferencia sectorial debe depender de proporciones de firmas, no de una
   equivalencia entre sector y régimen.
5. **La historia sobre horizontes no está derivada.** Escribir producción en
   `t+1` no genera por sí mismo una diferencia entre corto y largo plazo. Los
   horizontes deben quedar fuera de la proposición principal.
6. **La intuición aparece después de la notación.** La presentación debe empezar
   con dos empresas y una curva de retorno marginal; la política completa de
   cuatro casos puede pasar al apéndice.
7. **El shock de precio necesita un nombre preciso.** `z` debe interpretarse
   como una condición amplia de financiamiento que mueve el costo marginal
   relevante. El spread bancario de la tesis solo es un proxy empírico posible.

## 2. Nueva pregunta central

> **¿Cómo determina el acceso a financiamiento alternativo si un cambio en la
> disponibilidad de crédito bancario modifica la inversión de una empresa o
> solamente su mezcla de financiamiento?**

Esta pregunta coincide exactamente con la decisión que resuelve el modelo. La
comparación entre cantidad y precio queda dentro de la respuesta:

> Cuando el límite bancario es vinculante y sustituir el crédito es demasiado
> costoso, la cantidad disponible determina la inversión. Cuando la firma puede
> financiar la unidad marginal fuera del banco, ampliar la línea bancaria solo
> sustituye fuentes; el costo marginal del financiamiento determina la
> inversión.

## 3. Nuevo título de trabajo

**Credit Limits or Financing Costs? Alternative Finance and Firm Investment**

El título evita prometer un modelo de pronóstico y nombra directamente los
objetos que sí aparecen en el problema de la firma.

## 4. Motivación intuitiva

Considerar dos empresas con el mismo proyecto productivo:

- La empresa A agotó su línea bancaria y no tiene una alternativa a un costo
  razonable. Si el banco amplía la línea, invierte más.
- La empresa B también agotó la línea, pero puede usar bonos, crédito externo u
  otra fuente. Si el banco amplía la línea, reemplaza deuda cara por deuda
  bancaria, pero no necesariamente invierte más. Su escala responde al costo de
  la fuente marginal.

La pregunta económica deja de ser cuál indicador "gana" un ejercicio de
pronóstico. Pasa a ser qué fricción determina la inversión para cada tipo de
empresa. El patrón preliminar de la tesis motiva por qué vale la pena estudiar
esa heterogeneidad.

## 5. Jerarquía de resultados

### Resultado principal: firma

Con banco barato hasta el límite `B` y acceso heterogéneo a financiamiento
alternativo:

- si una firma solo puede financiarse con el banco y su capital deseado supera
  el límite, se detiene en `B` y `dk*/dB = 1`;
- si una firma tiene acceso alternativo y quiere invertir más allá del límite,
  continúa con esa fuente, `dk*/dB = 0`, y su inversión responde a `R_M`.

Esta es la contribución teórica que debe ocupar la mayor parte de la defensa.

### Corolario: sectores

Si el sector no transable contiene una mayor proporción de firmas en el primer
régimen, su inversión agregada es más sensible a la disponibilidad bancaria. Si
el sector transable contiene una mayor proporción de firmas en el segundo
régimen, es más sensible al costo marginal del financiamiento.

Esto es una hipótesis de composición contrastable, no una conclusión automática
sobre todas las firmas de cada sector.

### Aplicación empírica

El modelo propone tres interacciones que la tesis podría investigar:

1. El volumen de crédito debería ser más informativo donde la dependencia
   bancaria y la frecuencia de líneas agotadas sean mayores.
2. El spread debería ser más informativo donde las empresas tengan más acceso
   a financiamiento alternativo y su costo marginal covaríe con ese spread.
3. Una expansión de líneas debería elevar el financiamiento total de las firmas
   restringidas, pero cambiar principalmente la composición de pasivos de las
   firmas con sustitutos.

## 6. Qué retirar del argumento central

- No afirmar que el modelo explica el horizonte corto frente al largo.
- No afirmar que demuestra capacidad predictiva ni causalidad.
- No llamar al crédito observado exactamente igual que al límite de crédito.
- No presentar `lambda_N > lambda_T` como un hecho peruano ya establecido.
- No dedicar tiempo principal a los cuatro casos de la función de política,
  la extensión dinámica o la revisión extensa de literatura.

## 7. Estructura propuesta para la presentación final

1. Motivación: dos empresas, mismo proyecto, distinta capacidad de sustituir
   al banco.
2. Pregunta y respuesta en una frase.
3. Relación con la tesis: el patrón preliminar que motiva, sin prometer
   horizontes.
4. Agente, decisión y secuencia temporal.
5. Gráfico: retorno marginal decreciente y costo marginal escalonado.
6. Caso cantidad: por qué el óptimo queda en el límite.
7. Caso precio: por qué la firma continúa con otra fuente.
8. Proposición con todas sus condiciones.
9. Prueba económica y prueba formal: derivadas a ambos lados del quiebre.
10. Corolario sectorial y supuesto de composición.
11. Simulación de cambios pequeños y cruces de régimen.
12. Qué verifica el código y qué no puede demostrar.
13. Lean: enunciado, fragmento relevante y correspondencia con el paper.
14. Dónde se desconfió de la IA y verificación manual en pantalla.
15. Limitaciones, predicciones contrastables y preguntas para la clase.

## 8. Auditoría de requisitos de la entrega final

| Requisito | Estado actual | Cambio necesario |
|---|---|---|
| Pregunta y resultado con condición | Existe, pero promete demasiado sobre predicción | Usar la nueva pregunta y separar motivación empírica |
| Modelo | Completo | Presentarlo gráficamente antes de la notación |
| Proposición con condiciones | Completa | Dar prioridad a los dos regímenes relevantes |
| Prueba: terminado, difícil y abierto | Parcial en el paper, casi ausente en slides | Añadir una diapositiva de prueba y estado |
| Simulaciones: qué comprueban y qué no | Números presentes | Mostrar umbrales y declarar el límite del ejercicio |
| Lean: enunciado y fragmento | Solo se reporta el estado | Incluir código real y explicar exactamente qué verifica |
| Derivación manual y juicio sobre IA | Se menciona, no se muestra | Incluir un paso concreto y el veredicto |
| Dos o tres preguntas para crítica | Presente | Reemplazarlas por preguntas más focalizadas |
| Slides compiladas y fusionadas en `main` | Pendiente | Completar antes del 27 de octubre, 22:00 |

## 9. Preguntas focalizadas para recibir crítica

1. ¿Conviene interpretar el spread observado como proxy de una condición
   amplia de financiamiento o restringir el modelo al costo del crédito
   bancario?
2. ¿Qué variable disponible permite aproximar mejor el acceso a
   financiamiento alternativo por sector?
3. ¿La extensión más útil es endogenizar el límite bancario o introducir
   dinámica de inversión, una vez defendido el resultado estático?
