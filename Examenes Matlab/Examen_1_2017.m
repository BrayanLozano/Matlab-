% Examen tarea 1

%% 1) Creación, indexación y concatenación
% (0.6)- Cree una matriz mágica de 4x4 y cambie el orden de sus columnas de
% manera que su primera fila quede en orden ascendente.

% (0.5)- Encuentre los índices lineales de los números de la última fila
% conviértalos en índices matriciales.

% (0.4)- Cree un vector columna con 5 con elementos logarítmicamente 
% espaceados entre 0.1 y 100

% (0.5)- Cree un arreglo cúbico de 3x3x3, donde en la primera página todos
% los elementos sean el número 2, en la segunda todos el número 1 y en la
% tercera todos el número 0.

% (0.7)- En el menor número posible de líneas y usando los comandos vistos
% en clase, cree una matriz que simule la bandera del Reino Unido, donde el
% fondo sean ceros y las líneas rojas sean unos. 
% (no se puede hacer 'manualmente'). Pista: comando 'eye'.

% (0.3)- Usando indexado lógico y el comando numel, encuentre cuántos unos
% tiene la bandera.

%% 2) Gráficos 

% (0.5) Cree una figura con dos ejes en posición horizontal y guarde los
% handle de los 3 objetos gráficos creados en una variable.
x = 1:10;
y = 3*x -5;
y1 = y + 1.5*randn(1,10);
x1 = 1:0.0001:10;

% (1.0)- A partir de los datos anteriores encuentre un polinomio que se
% ajuste a y1 (polifit) evalúe ese polinomio (usando x1 en polyval) y grafique en los
% ejes superiores de la figura 'y', 'y1' y en los ejes inferiores grafique 
% 'y', 'y1' y el polinomio evaluado

% (0.5)- Por código, cambie el color de la línea del polinomio.
% (0.5)- Por código, cambie el tamaño de la figura al de la pantalla