%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 9: Estructuras y funciones para evitar ciclos

%% Tipos de datos: Struct
% Una tabla es una arreglo de datos de diferentes tipos, que tienen una
% naturaleza TABULAR (filas x columnas)

% Un arreglo de celdas, se usa para agrupar datos de diferentes tipos que
% quiero INDEXAR NUM�RICAMENTE

% ESTRUCTURAS
% Una estructura, se usa para agrupar datos de diferentes tipos que
% quiero acceder POR NOMBRE

% Se puede crear un estructura vac�a:
s = struct('a',{},'b',{},'c',{})
% Para ir llen�ndola... (�c�mo se llena?)

% O una estructura con datos desde su definici�n
field1 = 'f1';  value1 = zeros(1,10);
field2 = 'f2';  value2 = {'a', 'b'};
field3 = 'f3';  value3 = {pi, pi.^2};
field4 = 'f4';  value4 = {'fourth'};

s = struct(field1,value1,field2,value2,field3,value3,field4,value4)

% �C�mo obtengo la informaci�n almacenada en la estructura?


% Hay dos usos especialmente �ltiles de las estructuras:

% 1) Structure of arrays
data.x = linspace(0,2*pi);
data.y = sin(data.x);
% Especialmente �til para pasarle un grupo de argumentos a una funci�n
% data = struct('x',x,'y',y,'z',z,... y luego function my_fcn(data)

% 2) Array of structures: 
people(1).name = 'Pepe';
people(1).job = 'Ingeniero';
people(1).ID = 120815;

people(2).name = 'Mar�a';
people(2).job = 'Astronauta';
people(2).ID = 98734523;

people(3).name = 'Clara';
people(3).job = 'Gerente';
people(3).ID = 3456324;

% Especialmente �til para qu� tipo de datos?


% Ejercicio: Leer
% - Cell vs. Struct Arrays

% - �Para qu� sirve el comando 'dir'?
% - Cree una estructura y haga un ciclo para leer todos sus campos. Si
% tiene un texto concat�nelo, si tiene un n�mero, saque la varianza.

% Adicional:
% - Memory Requirements for a Structure Array

%% Find
% Cuando se tiene un arreglo de datos, podemos indexarlo
X = randn(10000,1);
hist(X,20)
x = X(1:20);
x > 2
% Con idexado l�gico
x(x>2)
% Pero a veces, no necesitamos los valores, sino las posiciones, para eso
% debe usarse find. El primer argumento es una condici�n l�gica
find(x>2)
% El segundo argumento, es el n�mero de resultados que quiero:
find(X>3)
find(X>3,5)
% Y el tercer argumento, la direcci�n de la b�squeda
find(X>3,5,'last')
find(X>3,5,'first')

% Se pueden usar condiciones l�gicas de cualquier tipo
M = magic(5);
find( M>10 & M<5)
find( M>10 | M<5)
% Y obtener los �ndices lineales
find( M>15 | M<5,3)
% O los matriciales
[x,y] = find( M>15 | M<5,3)

% Ejercicios: Compruebe lo siguiente:
find( M>15 | M<5,3)
ind2sub([5,5],find( M>15 | M<5,3))
[x,y] = ind2sub([5,5],find( M>15 | M<5,3))

% - �Qu� se obtiene en el tercer argumento de salida?
[x,y,val] = find( M>15 | M<5,5,'last')

% - Compruebe el resultado de los siguientes comandos y analice
c = num2cell(M)
M_cell{end} = []
isempty(c)
isempty(c{2,2})
isempty(c(2,2))
%
find(isempty(c(2,2)))
%
m = rand(5) -0.3
m(m<0)=0
[x,y,val] = find(m,5,'last');

%% Accumarray

% Para contar
subs = [1; 2; 4; 2; 4]
A = accumarray(subs,1)

% Para sumar por sub�ndice
val = 1:5;
subs = [1; 3; 4; 3; 4];
A = accumarray(subs,val)

% Para sumar por sub�ndice en diferentes columnas
val = 101:106;
subs = [1 1; 2 2; 3 2; 1 1; 2 2; 4 1];
[subs, val']
A = accumarray(subs,val)

% O para calcular cualquier funci�n seg�n los sub�ndices.
% Por ejemplo, la varianza...
val = [100.1 101.2 103.4 102.8 100.9 101.5]';
subs = [1 1; 1 1; 2 2; 3 2; 2 2; 3 2]
A1 = accumarray(subs,val,[],@var)
% O para pasar par�metros a la funci�n, se puede usar el handle como si
% fuera una funci�n an�nima
A2 = accumarray(subs,val,[],@(x) var(x,1))

% Tambi�n se pueden guardar los datos en una celda
val = 1:10;
subs = [1 1;1 1;1 1;1 1;2 1;2 1;2 1;2 1;2 1;2 2]
A = accumarray(subs,val,[],@(x) {x})
% Revise el resultado
A{2,1}

% Ejercicios:
% - Cree una matriz de 1's y 0's. Encuentre la posici�n del �ltimo 0 de
% cada columna (sin un ciclo).
% - Encuentre el m�ximo de cada columna de una matriz magic(5) (sin un
% ciclo).

%% Sortrows
A = (1:10)';
B = 10*rand(10,1);
C = [A B];
% Qu� resultado produce:
sortrows(C,1)
sortrows(C,2)
sortrows(C,-2)

% Tambi�n puede usarse en tablas
T = table(A,B);
sortrows(T,2)

% Ejercicio: Revise el siguiente ejemplo
LastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
Age = [38;43;38;40;49];
Height = [71;69;64;67;64];
Weight = [176;163;131;133;119];
BloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];

tblA = table(Age,Height,Weight,BloodPressure,'RowNames',LastName)
% �Qu� se guarda en tblB y en index?
[tblB,index] = sortrows(tblA,'RowNames')
% Qu� hace el comando:
[tblB,index] = sortrows(tblA,{'Height','Weight'},{'ascend','descend'})

