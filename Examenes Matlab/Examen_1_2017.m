% Examen tarea 1

%% 1) Creaci�n, indexaci�n y concatenaci�n
% (0.6)- Cree una matriz m�gica de 4x4 y cambie el orden de sus columnas de
% manera que su primera fila quede en orden ascendente.

% (0.5)- Encuentre los �ndices lineales de los n�meros de la �ltima fila
% convi�rtalos en �ndices matriciales.

% (0.4)- Cree un vector columna con 5 con elementos logar�tmicamente 
% espaceados entre 0.1 y 100

% (0.5)- Cree un arreglo c�bico de 3x3x3, donde en la primera p�gina todos
% los elementos sean el n�mero 2, en la segunda todos el n�mero 1 y en la
% tercera todos el n�mero 0.

% (0.7)- En el menor n�mero posible de l�neas y usando los comandos vistos
% en clase, cree una matriz que simule la bandera del Reino Unido, donde el
% fondo sean ceros y las l�neas rojas sean unos. 
% (no se puede hacer 'manualmente'). Pista: comando 'eye'.

% (0.3)- Usando indexado l�gico y el comando numel, encuentre cu�ntos unos
% tiene la bandera.

%% 2) Gr�ficos 

% (0.5) Cree una figura con dos ejes en posici�n horizontal y guarde los
% handle de los 3 objetos gr�ficos creados en una variable.
x = 1:10;
y = 3*x -5;
y1 = y + 1.5*randn(1,10);
x1 = 1:0.0001:10;

% (1.0)- A partir de los datos anteriores encuentre un polinomio que se
% ajuste a y1 (polifit) eval�e ese polinomio (usando x1 en polyval) y grafique en los
% ejes superiores de la figura 'y', 'y1' y en los ejes inferiores grafique 
% 'y', 'y1' y el polinomio evaluado

% (0.5)- Por c�digo, cambie el color de la l�nea del polinomio.
% (0.5)- Por c�digo, cambie el tama�o de la figura al de la pantalla