%% - Matlab: Herramienta de tecnología
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
A = rand(3, 5, 3); % rand, función que entrega números aleatorios uniformemente distribuidos entre 0 y 1.
linearInd = sub2ind(size(A), 2, 1, 2)   % size, función para encontrar el tamaño de un arreglo

% Ejercicios:
% - Indexe el elemento del "centro geométrico" de la matriz A de forma matricial
% - Indixe el mismo elemento la matriz A de forma lineal
% - Comprobar que ambos indexados dan el mismo valor usando la condición lógica ==
% - Revisar otras funciones: isempty, numel, length
%% Funciones de forma de matrices
M = randi(3,[4,3]); % Números enteros aleatorios de 1 a 3 en una matriz 4x3
repmat(M,2,1) % para repetir matrices
repmat(M,2)

reshape(M,2,6) % para cambiar la forma de una matriz
reshape(M,6,2)

X = cat(3,zeros(2,5),ones(2,5),2*ones(2,5)); % Crea arreglo de 3 dimensiones
permute(X,[3 2 1]) % Permuta las dimensiones de un arreglo, según el orden declarado en el segundo argumento

% Ejercicios
% - Qué quiere decir el comando reshape(M(:,[1 3]),6,1)
% - Qué resultado entrega M(:)
%% Indexado lógico
% Es un método de indexado muy poderoso, ahorra muchas líneas de código y
% muchos ciclos.

% Si tengo en un arreglo las edades de un grupo de personas
ages = randi(80,10,1); % 10 personas, hasta 80 años.
% Creamos una celda, con los nombres de 10 personas
% Q: ¿Por qué una celda?
names = {'Pedro', 'Juan', 'Santiago', 'María', 'Ángela', 'Natalia', 'Víctor', 'Jaime', 'Manuela', 'John'}';
% Y quiero saber cómo se llaman los mayores de 45 años, entonces
names(ages > 45)
% Q: ¿Qué diferencia tiene con names{ages > 45}?

% Ejercicios
% - Cree una matriz de 5x4 con números aleatorios entre -5 y 5
M = 10*rand(5,4) - 5;
% - Encuentre los índices de los números positivos
% - Encuentre los números positivos 
% Tome esos números positivos y guárdelos en una matriz cuadrada,
% rellene con ceros si es necesario.
% - Encuentre los índices lineales, de los elementos de la columna de mayor
% suma. (use max y sum)

