%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 6

%% Tipos de datos: Cells (arreglos de celdas)
% Se puede reservar memoria para un arreglo de celdas con:
mis_celdas = cell(3,4);
% O se puede crear directamente un arreglo de celdas así (indexando):
cell_arr{3,4} = [];
% Para indexar una celda, puede hacerse como un arreglo:
cell_arr(3,4)
% o puede hacerse directamente sobre los contenidos (el interior) de la
% celda:
cell_arr{3,4} %#ok<NOPTS>
% Si dejamos una matriz en una celda, no puede ser así
cell_arr(3,4) = magic(3);
% Debe ser así:
cell_arr{3,4} = magic(3)
% Dicha matriz puede indexarse internamente, ejemplo:
cell_arr{3,4}(1,:)

%% Conversión de numérico a celda
% La forma más simple es usando
num2cell(magic(3))
% Si no quiero que cada elemento sea una celda. Se puede especificar en 
% más detalle, el tamaño de cada celda con:
mat2cell(magic(3),[1 2],[2 1]) % Cómo funciona este comando?
% Ejercicio: Investigar otros comandos importantes para uso con celdas:
cellplot, cellstr


%% Tablas
% Las tablas son tipos de datos en Matlab, especiales para datos tabulares.
% Para crear una tabla, es suficiente con usar el siguiente comando:
table(1:10,2:11,3:12)
% Para hacerlo más claro y completo:
Edades = [28 15 25 23];
Nombres = {'Juan','Pedro','Sara','Ana'};
Apellidos = {'Carrillo', 'Posada', 'Rodríguez', 'Méndez'};
Estatura = [178 170 157 165];
% Observe la diferencia entre
T1 = table(Edades,[Nombres Apellidos],Estatura,'VariableNames',{'Edades','Nombres','Estatura'})
% y
T1 = table(Edades',[Nombres' Apellidos'],Estatura','VariableNames',{'Edades','Nombres','Estatura'})
% Si usamos vectores columna, las columnas de la tabla toman nombres
% directamente (excepto si...):
Edades= Edades'; Nombres= Nombres'; Apellidos=Apellidos';Estatura=Estatura';
T1 = table(Edades,[Nombres Apellidos],Estatura)
% Lo que muestra que los arreglos deben ser columnas
% También se pueden poner nombres en las filas:
T2 = table(Nombres',Estatura',Edades','RowNames',Apellidos')

% Una tabla puede indexarse y modificarse al igual que cualquier arreglo
% pero usando la notación de punto (.)
T2.Properties
T2.Var1

% Ejercicio: Cree una tabla usando el comando readtable (a partir de un
% archivo de excel cualquiera con texto y números).

% Ejercicio: Investigar los siguientes comandos:
% cell2table - table2cell
% array2table - table2array
% summary

% Observe el siguiente ejemplo:
% xlsread
values = {1, 2, 3 ; 4, 5, 'x' ; 7, 8, 9};
headers = {'First','Second','Third'};
xlswrite('myExample.xlsx',[headers; values]);

filename = 'myExample.xlsx';
A = xlsread(filename)

% Adicional: Ver ejemplo en la ayuda: 'Clean Messy and Missing Data in Tables'

