## 3) Verdadero/ Falso. Justificar

El estado nacional implementó distintos subsidios destinados a sectores productivos. Cada subsidio tiene un nombre y un monto asignado.
Para cada subsidio se realiza una liquidación mensual, de la cual se registra a qué mes y año corresponde, el total gastado y la fecha de realización. En esta liquidación, a cada beneficiario del subsidio se le liquida un monto, el cual dependerá de la situación del beneficiario. Un beneficiario puede ser una persona Jurídica o Física, y en el caso de la persona física, debe estar inscripta en el monotributo. De cada beneficiario se conoce la actividad económica en la cual se encuentra inscripto y su cuil o cuit que lo identifica. De las personas jurídicas se conoce la razón social, provincia, departamento, localidad y cantidad de empleados. De las personas físicas se conoce nombre y apellido, provincia, departamento, localidad y categoría del monotributo. 

Para el diagrama de Entidades y Relaciones propuesto responda si las siguientes afirmaciones son verdaderas (V) o falsas (F). Justificar:

**A.** La relación tiene está mal definida, ya que debería ser entre persona y
categoría_monotributo. 

**B.** La relación realiza está bien definida, ya que todas las personas realizan actividades. 

**C.** La jerarquía de Persona representa correctamente la problemática.


**D.** La relación pertenece está mal definida, ya que no puede haber atributos en las
relaciones.


**E.** La agregación de la relación posee está correctamente definida ya que con una relación uno a muchos se puede agregar.

**F.** Con este diseño es posible conocer el saldo disponible del subsidio para futuras
liquidaciones.

**G.** El modelo no tiene redundancia de datos. 

---

**Respuesta:**

**A.** Falso: *Si la relación tiene se pone con Persona, se estaría incluyendo a persona juridica, y las personas juridicas no necesitan estar inscriptas en el monotributo.*

**B.** Verdadero

**C.** Falso: *El modelo actual (con especialización) permite que hayan personas que no sean ni Físicas ni Jurídicas, lo que no está contemplado en el dominio del enunciado. Debería ser una Generalización, para obligar que sean si o si o una u otra*

**D.** Falso? *Según DBD, es una definición correcta, ergo entiendo que es válido... Preguntar ¿Por qué en BD1 nos dicen que no pongamos?*

**E.** Falso: *la cardinalidad máxima para cada entidad de la relación siempre es mayor a 1*

**F.** Verdadero?


**G.** Falso: *El nombre de las personas físicas se guarda tanto en la tabla Persona como el Física. Además tanto la Pertenece como Subsidio tienen el atributo monto*

