function Examen_2
% Entrega a d-jaramillo@javeriana.edu.co


%% (3.5) Funciones y ciclos
% Cree una función que recibe entre 1 e "infinitos" argumentos de entrada y
% entrega entre 1 e "infinitos" argumentos de salida.

% - Si recibe 1 entrada: 
% - La entrada representa el número de pacientes por hora que atiende un hospital
pac_hr = 5*randi([10 100],24,1);
% Además, se tiene el siguiente arreglo de celdas:
edades = cell(24,1);
% La función debe llenar 'edades' con un vector que contenga números aleatorios enteros
% entre 0 y 95, que represente cada una de las edades de los pacientes atendidos en
% cada hora.
% El argumento de salida debe ser el arreglo 'edades' lleno.

% - Si recibe 2 entradas:
% El primer argumento de entrada será nuevamente 'pac_hr'
% El segundo argumento de entrada debe ser el string 'graph'
% La función debe entregar dos salidas:
% 1- Entregar nuevamente el arreglo 'edades' lleno.
% 2- Use indexado lógico y 'sum' para obtener el número de pacientes con menos
% de 18 años (jóvenes), entre 18 y 59 (adultos) años y entre 60 y 95 
% (mayores) años por cada hora.
% Cree un gráfico de barras ('bar') con la opción 'stack' para mostrar los 
% pacientes jovenes, adultos y mayores atendidos en cada hora en el hospital.
% El segundo argumento de salida debe ser el handle de esa gráfica.



%% (2.0) Objetos de tiempo
% Guarde en un objeto la fecha en la que usted nació, mostrando el día de
% la semana.



% ¿Cuánto tiempo pasó (en años, días y horas) entre su nacimiento y el 11
% de septiembre de 2001?



% ¿Cuánto tiempo pasó en horas?



% Cree un arreglo que contenga las fechas del último día de cada mes del
% año.



end