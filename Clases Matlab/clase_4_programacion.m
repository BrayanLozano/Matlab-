%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 4
% ------- COMPLETAR DURANTE LA CLASE -------%
%% if
T = 5*randn + 15;
if T < 5
    disp('Hace mucho frío')
elseif T < 10 && T > 5
    disp('Hace frío')
else T > 15 && ??
    disp('')
end

%% Switch
% Revisar (any,isequal,strcmp, input)
datos = randi(100,5,5);
tipo_graf = input('ingrese el gráfico deseado',s)

switch tipo_graf
    case 'bar'
    case 'pie'
%% for

%% while
% Revisar (continue, break, pause, return)

%% Try catch (ver doc)