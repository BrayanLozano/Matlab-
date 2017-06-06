%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 2

%% Indexado 
% Viene de clase 1 (lineal, matricial)
% Funciones importantes

% Pasar de indexado lineal a matricial
[i,j] = ind2sub([4,3],[1 5 7 9]) 

IND = [3 4;5 6];
s = [2,2,2];
[I,J,K] = ind2sub(s,IND)

% Pasar de indexado matricial a lineal 
A = rand(3, 5, 3); % rand, funci�n que entrega n�meros aleatorios uniformemente distribuidos entre 0 y 1.
linearInd = sub2ind(size(A), 2, 1, 2)   % size, funci�n para encontrar el tama�o de un arreglo

% Ejercicios:
% - Indexe el elemento del "centro geom�trico" de la matriz A de forma matricial
% - Indixe el mismo elemento la matriz A de forma lineal
% - Comprobar que ambos indexados dan el mismo valor usando la condici�n l�gica ==
% - Revisar otras funciones: isempty, numel, length
%% Funciones de forma de matrices
M = randi(3,[4,3]); % N�meros enteros aleatorios de 1 a 3 en una matriz 4x3
repmat(M,2,1) % para repetir matrices
repmat(M,2)

reshape(M,2,6) % para cambiar la forma de una matriz
reshape(M,6,2)

X = cat(3,zeros(2,5),ones(2,5),2*ones(2,5)); % Crea arreglo de 3 dimensiones
permute(X,[3 2 1]) % Permuta las dimensiones de un arreglo, seg�n el orden declarado en el segundo argumento

% Ejercicios
% - Qu� quiere decir el comando reshape(M(:,[1 3]),6,1)
% - Qu� resultado entrega M(:)
%% Indexado l�gico
% Es un m�todo de indexado muy poderoso, ahorra muchas l�neas de c�digo y
% muchos ciclos.

% Si tengo en un arreglo las edades de un grupo de personas
ages = randi(80,10,1); % 10 personas, hasta 80 a�os.
% Creamos una celda, con los nombres de 10 personas
% Q: �Por qu� una celda?
names = {'Pedro', 'Juan', 'Santiago', 'Mar�a', '�ngela', 'Natalia', 'V�ctor', 'Jaime', 'Manuela', 'John'}';
% Y quiero saber c�mo se llaman los mayores de 45 a�os, entonces
names(ages > 45)
% Q: �Qu� diferencia tiene con names{ages > 45}?

% Ejercicios
% - Cree una matriz de 5x4 con n�meros aleatorios entre -5 y 5
M = 10*rand(5,4) - 5;
% - Encuentre los �ndices de los n�meros positivos
% - Encuentre los n�meros positivos 
% Tome esos n�meros positivos y gu�rdelos en una matriz cuadrada,
% rellene con ceros si es necesario.
% - Encuentre los �ndices lineales, de los elementos de la columna de mayor
% suma. (use max y sum)

