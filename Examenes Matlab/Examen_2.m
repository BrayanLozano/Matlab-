function Examen_2
% Entrega a d-jaramillo@javeriana.edu.co


%% (3.5) Funciones y ciclos
% Cree una funci�n que recibe entre 1 e "infinitos" argumentos de entrada y
% entrega entre 1 e "infinitos" argumentos de salida.

% - Si recibe 1 entrada: 
% - La entrada representa el n�mero de pacientes por hora que atiende un hospital
pac_hr = 5*randi([10 100],24,1);
% Adem�s, se tiene el siguiente arreglo de celdas:
edades = cell(24,1);
% La funci�n debe llenar 'edades' con un vector que contenga n�meros aleatorios enteros
% entre 0 y 95, que represente cada una de las edades de los pacientes atendidos en
% cada hora.
% El argumento de salida debe ser el arreglo 'edades' lleno.

% - Si recibe 2 entradas:
% El primer argumento de entrada ser� nuevamente 'pac_hr'
% El segundo argumento de entrada debe ser el string 'graph'
% La funci�n debe entregar dos salidas:
% 1- Entregar nuevamente el arreglo 'edades' lleno.
% 2- Use indexado l�gico y 'sum' para obtener el n�mero de pacientes con menos
% de 18 a�os (j�venes), entre 18 y 59 (adultos) a�os y entre 60 y 95 
% (mayores) a�os por cada hora.
% Cree un gr�fico de barras ('bar') con la opci�n 'stack' para mostrar los 
% pacientes jovenes, adultos y mayores atendidos en cada hora en el hospital.
% El segundo argumento de salida debe ser el handle de esa gr�fica.



%% (2.0) Objetos de tiempo
% Guarde en un objeto la fecha en la que usted naci�, mostrando el d�a de
% la semana.



% �Cu�nto tiempo pas� (en a�os, d�as y horas) entre su nacimiento y el 11
% de septiembre de 2001?



% �Cu�nto tiempo pas� en horas?



% Cree un arreglo que contenga las fechas del �ltimo d�a de cada mes del
% a�o.



end