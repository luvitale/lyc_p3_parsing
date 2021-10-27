# Práctica de Parsing

1. Dada la siguiente gramática con elementos terminales `fin`, `:=` y `exp`


P -> L E fin

L -> L , id

L -> id

E -> := exp

a) Generar el autómata de estados para el parsing SLR

b) Definir los conjuntos Primeros y Siguientes

c) Generar la tabla SLR

d) Probar el parsing con el siguiente ejemplo: `id,id,id,id:=exp`; y obtener la lista de reglas

e) Probar con FLEX y BISON y comparar la lista de reglas obtenida

2. Dada la siguiente gramática

R1: S → ( L )

R2: S → ( )

R3: L → ( L )

R4: L → L ( )

R5: L → ( )

a) Generar el autómata de estados para el parsing SLR

b) Definir los conjuntos Primeros y Siguientes

c) Generar la tabla SLR

d) Probar el parsing con el siguiente ejemplo: `( ((( ))) ( ) ( ) )` y obtener la lista de reglas

e) Probar con FLEX y BISON y comparar la lista de reglas obtenida

3. Dada la gramática del ejercicio 4 de la práctica 2

a) Generar el autómata de estados para el parsing SLR

b) Definir los conjuntos Primeros y Siguientes

c) Generar la tabla SLR

d) Probar el parsing con el siguiente ejemplo `actual:= (contador/342) + (contador*contador);` y obtener la lista de reglas

e) Probar con FLEX y BISON y comparar la lista de reglas obtenida