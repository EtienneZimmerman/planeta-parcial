# Parcial Objetos 2023
![image](https://es.azeheb.com/blog/wp-content/uploads//2017/08/os-planetas-mais-extremos-ja-descobertos.jpg)

## Modelo básico de personas y planetas.

Nos piden armar parte del modelo de un juego con temática de Star Wars, que incluye a los planetas y a sus habitantes.

De cada **persona** se registra su _edad_, o sea cuántos años tiene. Debe poder obtenerse: la _potencia_, la _inteligencia_ y si es o no _destacado_. Potencia e inteligencia son dos valores numéricos.
En principio, corresponden estas definiciones:
- la _inteligencia_ es de 12 para las personas de entre 20 y 40 años, y de 8 para las otras.
- la _potencia_ es de 20 para todas las personas.
- una persona _es destacada_ si tiene, exactamente, 25 ó 35 años. O sea, si una persona tiene 25 años es destacada, si tiene 35 años es destacada, si tiene cualquier otra edad no es destacada.

Además de estas definiciones que sirven para la generalidad de las personas, se definen algunos tipos de personas con características especiales. En principio vamos a contemplar a los atletas y los docentes.

De cada **atleta** se mantienen la masa muscular (que comienza en 4 kilos) y la cantidad de técnicas que conoce (que comienza en 2).  
La _potencia_ de un atleta es la suma del valor común para todas las personas, con la multiplicación entre masa muscular y cantidad de técnicas que conoce.  
Un atleta _es destacado_ si cumple la condición común para todas las personas, o bien, conoce más de 5 técnicas.  
Definir las siguientes dos acciones para los atletas:
- _entrenar_ una cantidad de días: el efecto es sumar a la masa muscular 1 kilo por cada 5 días de entrenamiento. P.ej. el efecto de entrenar 15 días, es sumar 3 kilos a la masa muscular.
- _aprender una técnica_: el efecto es sumar uno a la cantidad de técnicas que conoce el atleta.

De cada **docente** se conoce la cantidad de cursos que dio, que arranca en 0.  
La _inteligencia_ de un docente es la suma del valor común para todas las personas, con el doble de la cantidad de cursos que dio.  
Un docente _es destacado_ si dio más de 3 cursos.  
**¡Atención!** la condición general para considerar a una persona como destacada **no** corre para los docentes, o sea, un docente que haya dado 3 o menos cursos nunca es destacado, aunque tenga p.ej. 25 años. <br/><br/>

De cada **planeta** se conocen los habitantes, que son personas. También la cantidad de museos que hay en el planeta.  
Se tiene que poder obtener, para cada planeta
- la _delegación diplomática_, que está formada por los habitantes destacados.
- si _es culto_: la condición es que haya al menos dos museos, y que todos los habitantes tengan al menos 10 unidades de inteligencia.
- la _potencia real_: es la suma de la potencia de todos los habitantes. 


## Test sobre el escenario básico

Considerar estas seis personas:
- Julieta, una persona genérica de 42 años.
- Ana, una atleta de 25 años.
- Rosa, una atleta de 45 años que conoce 8 técnicas.
- Perla, una atleta de 28 años que conoce 4 técnicas, y de masa muscular 6.
- Mónica, una docente de 45 años que dio 6 cursos.
- Luisa, una docente de 35 años que dio un curso.

Verificar que tienen los valores indicados en la tabla que sigue

| persona | Potencia | Inteligencia | Es destacada |
| --- | --- | --- | --- | 
| Julieta | 20 | 8 | no |
| Ana | 28 | 12 | sí |
| Rosa | 52 | 8 | sí |
| Perla | 44 | 12 | no |
| Mónica | 20 | 20 | sí |
| Luisa | 20 | 14 | no |

Considerar el planeta Tritón, que tiene a estas seis personas como habitantes. Verificar que:
- la delegación diplomática está formada por Ana, Rosa y Mónica
- el valor inicial de defensa es 2
- no es un planeta culto
- la potencia real es 184  

Sugerencia: definir a las personas como un Set (o sea `#{...}`) y no como un List (o sea, `[...]`). Así se va a simplificar el chequeo de la delegación diplomática. <br/><br/>

Finalmente, en un test aparte, hacer que Perla entrene 15 días y aprenda una técnica. Después de eso, la potencia tiene que ser 65, y todavía no tiene que ser destacada. **Después** hacer que aprenda una técnica más. Después de aprender esta segunda técnica adicional, Perla tiene que ser destacada.


## Más sobre el planeta

Agregar, para cada planeta, la longitud total de sus murallas, que está medida en kilómetros. Agregar también dos acciones
- _construir murallas_: suma una cantidad que se indica a la longitud de las murallas.
- _fundar un museo_: suma uno a la cantidad de museos de la ciudad.

Agregar las siguientes consultas para un planeta:
- _potencia aparente_: es la potencia del habitante más potente, multiplicada por la cantidad de habitantes del planeta. P.ej. si un planeta tiene 4 habitantes con potencia 20, 28, 35, y 40, entonces la potencia aparente es 40 * 4 = 160. En el mismo caso, la potencia real es 123.
- si _necesita reforzarse_: la condición es que la potencia aparente sea el doble de la real o más.

Y la siguiente acción: _recibir tributos_. Cuando ocurre esto, cada habitante ofrece su tributo **al planeta**. Para un docente, el tributo es fundar un museo. Para un atleta, es construir 2 kilómetros de murallas. Las personas genéricas no tienen nada que ofrecer; cuando se les pide que ofrezcan su tributo a un planeta, no hace nada. 


## Valor de cada persona
Agregar la capacidad de preguntarle a cualquier persona su _valor_, que es la suma de potencia más inteligencia. Para los docentes, se suman 5 unidades adicionales.  
Se debe poder consultar, para un planeta, la colección de _habitantes valiosos_, que son aquellos cuyo valor es de 40 o más.


## Apaciguar a otro planeta
Agregar para un planeta, la acción de _apaciguar_ a otro planeta.
Cuando se le pide a un planeta X que apacigüe a otro planeta Y, lo que debe ocurrir es que cada habitante valioso de X ofrezca su tributo a Y.   
P.ej. si tenemos dos planetas, Tritón y Paleas, y se le pide a Tritón que apacigüe a Paleas, el efecto debe ser que todos los habitantes valiosos de Tritón ofrezcan su tributo a Paleas.


## Soldados
Agregar un nuevo tipo específico de personas, los **soldados**. Cada soldado tiene una colección de armas.
La _potencia_ de un soldado es la suma del valor común para todas las personas, con la suma de la potencia que cada arma le otorga **a ese soldado**.
El _tributo_ que un soldado ofrece a una ciudad es construir 5 kilómetros de murallas.

Se deben considerar estos dos tipos de armas:
- **Pistolete**: de cada pistolete se sabe su largo en centímetros. 
La potencia que le otorga a un soldado se obtiene así: si el soldado tiene más de 30 años, entonces es el triple del largo; si no, el doble.  
P.ej. un pistolete de 8 cm le otorga 24 unidades de potencia a un soldado de 50 años, pero solamente 16 unidades a un soldado de 24 años.

- **Espadón**: de cada espadón se sabe el peso en kilos.
La potencia que le otorga a un soldado se obtiene así: si el soldado tiene menos de 40 años, entonces es la mitad de su peso; si no, es de 6 unidades independientemente del peso.  
P.ej. un espadón de 20 kilos le otorga 10 unidades de potencia a un soldado de 24 años, pero solamente 6 unidades a un soldado de 50 años.
  
