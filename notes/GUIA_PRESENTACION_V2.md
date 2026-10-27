# Guía de exposición del modelo v2

## Objetivo de la presentación

La audiencia debe salir entendiendo cuatro ideas:

1. La empresa tiene crédito bancario barato, pero limitado.
2. Conseguir dinero fuera del banco tiene un costo adicional `tau`.
3. Existe un umbral `tau_star` que determina si la empresa se detiene o sigue
   invirtiendo.
4. Las diferencias sectoriales pueden surgir porque las empresas de cada sector
   enfrentan distribuciones diferentes de ese costo.

Si una explicación no ayuda a una de estas cuatro ideas, no debe ocupar tiempo
principal en la exposición.

## Vocabulario oral recomendado

| Notación | Cómo decirla en voz alta |
|---|---|
| `n` | fondos propios de la empresa |
| `b` | crédito utilizado del banco |
| `B` o `b_bar` | límite de la línea bancaria |
| `m` | fondos obtenidos fuera del banco |
| `R_B` | costo del crédito bancario |
| `tau` | costo adicional de financiarse fuera del banco |
| `R_B + tau` | costo total del financiamiento alternativo |
| `k` | inversión o capital instalado |
| `k_bar=n+B` | capital que puede financiarse agotando el banco |
| `tau_star` | costo máximo que hace rentable seguir invirtiendo |

Evitar en la explicación inicial expresiones como "régimen de precio",
"régimen de cantidad", "margen extensivo" o "suficiente estadístico".
Pueden utilizarse después de que la intuición ya esté clara.

## Respuesta de treinta segundos

> La empresa utiliza primero crédito bancario porque es más barato, pero el
> banco impone un límite. Para invertir por encima de ese límite debe pagar un
> costo adicional `tau`. Comparo ese costo con el retorno de una unidad más de
> inversión. Esa comparación genera un umbral: si `tau` es alto, la empresa se
> detiene en el límite bancario; si es bajo, utiliza la fuente alternativa y
> produce más.

## Estructura y tiempos

La meta es hablar durante 27--30 minutos y dejar el resto para preguntas.

### Título — 30 segundos

No explicar todavía la tesis completa. Decir:

> El trabajo estudia una pregunta concreta: qué ocurre con la inversión cuando
> una empresa agota su crédito bancario y debe decidir si paga más por otra
> fuente de fondos.

### 1. El problema económico — 2 minutos

Contar una sola historia:

> Imaginemos una empresa que ya utilizó toda su línea bancaria, pero todavía
> tiene un proyecto rentable. Puede detenerse o financiar la siguiente unidad
> fuera del banco. No basta con decir que existe otra fuente: importa cuánto
> cuesta acceder a ella.

Transición:

> Esa comparación entre retorno y costo es todo el mecanismo del modelo.

### 2. Pregunta y respuesta — 1.5 minutos

Leer la pregunta una vez. Después decir la respuesta sin notación:

> Existe un costo máximo que la empresa está dispuesta a pagar para seguir
> invirtiendo. Por encima, se detiene. Por debajo, consigue fondos alternativos
> y amplía su escala.

No mencionar todavía transables y no transables.

### 3. Motivación empírica — 1.5 minutos

> La tesis encuentra preliminarmente que el volumen de crédito y un spread no
> contienen la misma información para todos los sectores. El modelo no pretende
> demostrar esos resultados ni sus horizontes. Propone un mecanismo que puede
> contrastarse: las empresas difieren en el costo de sustituir al banco.

Subrayar la limitación antes de que el profesor tenga que señalarla.

### 4. Problema de la empresa — 3 minutos

Explicar cada término de izquierda a derecha:

1. `beta F(k)`: valor presente de la producción futura.
2. `R_B b`: costo del crédito bancario utilizado.
3. `(R_B+tau)m`: costo de los fondos obtenidos fuera del banco.
4. `k=n+b+m`: cada unidad de capital debe financiarse.
5. `b<=B`: el banco es barato, pero no presta ilimitadamente.

Frase clave:

> `tau` no representa que una empresa tenga o no tenga acceso. Representa qué
> tan costoso es ese acceso. Un valor suficientemente alto equivale
> económicamente a no poder utilizar la fuente.

### 5. Construcción del umbral — 3 minutos

Definir primero `k_bar=n+B` en palabras. Después:

> Al llegar al límite, la siguiente unidad produce `beta F'(k_bar)` y cuesta
> `R_B+tau`. La empresa continúa si el retorno es mayor que el costo.

Reordenar la desigualdad lentamente:

```text
beta F'(k_bar) > R_B + tau
tau < beta F'(k_bar) - R_B
tau < tau_star
```

Frase clave:

> El umbral no se impone; sale de la decisión de la empresa.

### 6. Proposición — 2.5 minutos

Explicar primero la columna izquierda completa y luego la derecha.

Para `tau>tau_star`:

> La fuente alternativa cuesta demasiado. La inversión es exactamente lo que
> permiten los fondos propios y la línea bancaria. Una unidad adicional de
> línea genera una unidad adicional de capital.

Para `tau<tau_star`:

> La empresa ya está utilizando la fuente alternativa. Una unidad adicional
> del banco reemplaza una unidad de fondos caros, pero no cambia la escala. En
> cambio, reducir `tau` sí aumenta la inversión.

### 7. Prueba — 2.5 minutos

No leer todas las ecuaciones. Señalar el objeto decisivo:

> La pendiente de beneficios justo después del límite es `tau_star-tau`.
> Si es negativa, no conviene cruzar el límite. Si es positiva, conviene seguir.
> Como la tecnología es estrictamente cóncava, la pendiente va cayendo y el
> punto encontrado es el único máximo global.

Qué está terminado: umbral, unicidad y comparativas locales.

Qué sigue abierto: disciplinar empíricamente la distribución sectorial.

### 8. Caso cuadrático — 2 minutos

La ecuación más importante es

```text
k* - k_bar = max{0,(tau_star-tau)/(beta c)}.
```

Explicarla así:

> Si `tau` está por encima del umbral, la inversión adicional es cero. Si está
> por debajo, la distancia al umbral determina cuánto capital adicional instala
> la empresa. La curvatura `c` amortigua esa respuesta.

Esta ecuación responde a la pregunta de "en qué medida" sin necesitar una
calibración estructural completa.

### 9. Ejemplo numérico — 1.5 minutos

No leer todos los parámetros. Decir:

> Con estos valores, el umbral es `0.9725`. Una empresa con `tau=1.10` se
> detiene en `0.9`. Una empresa con `tau=0.90` invierte `1.053`. La diferencia
> no proviene de una etiqueta de sector; proviene del costo de sustituir al
> banco.

### 10. Sectores — 2 minutos

> Ahora, y solo ahora, introduzco sectores. Cada empresa tiene su propio `tau`.
> `G_s` describe cómo se distribuyen esos costos dentro del sector. El modelo
> determina la proporción restringida: es la masa situada por encima del
> umbral.

Evitar afirmar que ya se demostró que `G_N` está a la derecha de `G_T`.

### 11. Predicciones empíricas — 1.5 minutos

Enfatizar que son interacciones observables:

- líneas agotadas por cambios en cantidad;
- uso de fuentes no bancarias por cambios en costo;
- sustitución de pasivos frente a aumento de financiamiento total.

### 12. Simulación — 1 minuto

> El código verifica las identidades y todos los números. No verifica que el
> spread observado sea `tau`, que las distribuciones sectoriales sean las
> supuestas ni que exista causalidad.

### 13. Lean — 1.5 minutos

> El enunciado formal prueba que estar debajo del umbral equivale exactamente a
> que el capital deseado con financiamiento alternativo supere el límite
> bancario. Lean comprueba el álgebra bajo los supuestos declarados; no comprueba
> la interpretación económica.

### 14. Fragmento de la prueba Lean — 1 minuto

> La prueba primero utiliza que `beta*c` es positivo. Eso permite eliminar el
> denominador sin cambiar el sentido de la desigualdad. Después despliega las
> definiciones y `nlinarith` verifica la equivalencia algebraica. La implicación
> inversa repite los mismos pasos.

### 15. Verificación de IA — 1.5 minutos

> La versión inicial trataba `lambda_N>lambda_T` como mecanismo. Eso era
> circular: asumíamos el ranking que queríamos explicar. La corrección fue
> modelar `tau_i` y obtener `lambda_s=1-G_s(tau_star)`.

Debe mostrarse la derivación manuscrita del signo de `tau_star-tau` y de
`k_M(tau_star)=k_bar`.

### 16. Límites y preguntas — 2 minutos

Cerrar sin introducir una extensión nueva. La última frase debe ser:

> El resultado teórico está identificado con claridad. La principal decisión
> pendiente es cómo medir `tau` y disciplinar su distribución en los datos
> peruanos.

## Preguntas probables del profesor

### "¿Por qué el banco es siempre más barato?"

Es un supuesto de ordenamiento que permite estudiar una línea bancaria
preferida pero limitada. Puede justificarse por relaciones bancarias, costos
fijos de emisión o información. Si la fuente alternativa fuera más barata, el
orden de uso cambiaría y no sería el mecanismo estudiado.

### "¿No es obvio que financiamiento más barato aumenta inversión?"

El resultado no es solo ese signo. El modelo identifica un umbral, muestra que
el efecto es cero por encima de él, deriva el exceso de inversión por debajo y
demuestra cuándo una ampliación bancaria cambia inversión o solamente sustituye
pasivos.

### "¿Por qué usar el spread bancario para medir `tau`?"

No se afirma que sean iguales. El spread es un proxy candidato porque puede
comoverse con condiciones amplias de financiamiento. La validez de ese proxy es
una limitación y una pregunta empírica central.

### "¿Dónde están los sectores en el modelo?"

El problema individual se resuelve primero. Los sectores aparecen como
distribuciones diferentes de `tau_i`. Esto evita confundir una etiqueta
sectorial con un régimen de financiamiento.

### "¿El modelo explica horizontes de pronóstico?"

No. El modelo es estático y explica heterogeneidad en el margen financiero.
Horizontes requieren capital dinámico, costos de ajuste o maduración de
proyectos.

### "¿Qué genera el límite bancario?"

En el modelo base es una primitiva reducida. Puede interpretarse como
colateral, capacidad de monitoreo o restricciones de pledgeability. La primera
extensión natural es `B=phi n`.

## Errores que deben evitarse

- Llamar causal a una relación de pronóstico.
- Decir que toda empresa no transable está restringida.
- Decir que `tau` es exactamente el spread observado.
- Decir que el modelo explica el horizonte corto o largo.
- Presentar `lambda_N>lambda_T` como resultado empírico ya verificado.
- Introducir la extensión dinámica antes de que el umbral esté claro.
