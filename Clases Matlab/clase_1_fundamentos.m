%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 1

%% Ventanas de Matlab

%% Ingreso de comandos (flecha arriba, Command History, tab, fx button, ...) 

%% Comandos b�sicos
% diary
% format, ans, clc, more

%% Ayudas:
% - Ayuda r�pida: par�ntesis abierto o auto-completar
% - Ayuda F1
% - mathworks.com

%% Ingreso de arreglos
x = [1 2 3] % Ingreso elemento a elemento
x = [1; 2; 3] % Vector columna
x = 1:3 % Operador :
x = (1:3)' % Operador transponer
x = 1:2:11 % Intervalo diferente a 1
x = 10:-1:5 % Se puede usar cualquier intervalo
x = linspace() % Cuando no conozco el intervalo exacto y creo un espacio lineal
x = logspace() % Cuando no conozco el intervalo exacto y creo un espacio logar�tmico

% Ejercicios
% - Cree un vector fila con los n�meros primos del 1 al 10
% - Cree un vector columna todos los m�ltiplos de 17, entre 100 y 200
% - Cree un vector columna con 14 elementos con separaci�n logar�tmica entre 0.1 y 100

%% Concatenar
a = 1:3
b = 1:2
[a b] % Concatenado manual
% Qu� pasa si hacemos:
[a; b] % �Por qu�?
% Podemos concatenar cualquier n�mero de arreglos en cualquier posici�n...
% siempre y cuando... ?
c = 5:-1:1
x = [a b; c]
% ... La matriz sea conformable (rectangular, sin huecos)

z = zeros(1,5,3) % Para crear arreglos de ceros
% El tercer elemento, es el tama�o de la tercera dimensi�n
o = ones(2,5,2) % Para crear arreglos de unos

% Funci�n cat (leer ayuda)
cat(3,[1 1 1],[2 2 2])

% Ejercicios
% - �De qu� otras maneras se pueden concatenar a, b y x?
% - Concatene en una sola matriz, los arreglos x, z y o.




% Rta: A = [z; cat(3,x,o)]

%% Indexar y borrar
% Hay dos formas de indexar un arreglo
% - Indexado lineal
x(1)
% - Indexado matricial
x(2,1)
% Operadores importantes
% : -> todos los elementos
% end -> �ltimo elemento

% Ejercicios
M = magic(5);
% - Encontrar los elementos de las primeras 5 posiciones del arreglo A
% - Encontrar todos los elementos de la tercera fila de M
% - Indexar las columnas 2 y 5 de M
% - Encontrar los elementos de las posiciones impares de x
% - Encontrar las �ltimas 3 posiciones de la �ltima columna de M