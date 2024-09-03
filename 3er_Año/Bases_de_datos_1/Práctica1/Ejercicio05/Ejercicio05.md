## 5) Verdadero/Falso en Transformación del modelo de E/R al modelo Relacional. Cursos

semestre (**#semestre**, nro, año)

curso (**codigo**, nombre, reseña)

profesor (**cuil**, nyap, fecha_nac, fecha_ingreso)

infocurso (**idic**, fecha_comienzo, aula, día_semana, hora)

brinda (#**semestre**, **codigo**)

tiene (**#semestre**, **codigo**, **idic**)

dicta (idic, **cuil**)

---

Dada la transformación 1 a 1 del modelo de entidades y relaciones al modelo relacional,
responda si las siguientes afirmaciones son V o F: 

**A.** La relación brinda tiene los atributos correspondientes y su clave está bien definida

**B.** La relación tiene tiene los atributos correspondientes y su clave está bien definida

**C.** La relación dicta tiene los atributos correspondientes y su clave está bien definida

**D.** La relación tiene no debería existir y los identificadores de la agregación deberían estar en InfoCurso. 

**E.** La relación dicta no debería existir y los atributos de Profesor deberían estar en InfoCurso. 

---

**Respuesta:**

**A.** Verdadero: *"Un curso se brinda en un semestre"*

**B.** Verdadero: *"Un curso de un semestre tiene info"*

**C.** Falso: *También se debería incluir el cuil como parte de la clave, para poder identificar correctamenta cada caso individual y que la clave cumpla su función*

**D.** Verdadero???: *"Es una opción válida lo que plantea el enunciado, creo ni ideaa"*

**E.** Falso: *"La relación dicta está correctamente definida"*
