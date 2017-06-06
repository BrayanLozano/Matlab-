%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 5

%% Funciones

% ¿Cuándo debo utilizar una función y cuándo un script?
% Rta:
% Característica principal: CADA FUNCIÓN TIENE SU PROPIO WORKSPACE

% Notaciones:
% function clase_semana_5 % Función sin argumentos (es un script)
% function clase_semana_5(in_1,in_2)  % Función con argumentos de entrada

% Función con argumentos de entrada y salida
function [out_1,out_2] = clase_semana_5(in_1,in_2)
y = 0;
% Solo es necesario cerrar la función con 'end' si hay varias funciones en
% un mismo archivo .m
end
% Nota: una función debe llamarse igual que su archivo .m

%% Funciones locales o anidadas (local or nested)

function mi_funcion
    disp('esta es mi función')
    x = 1;
    % mi_funcion queda definida como una función local de la función clase_semana_5
    function fcn_anidada
        disp(x)
        disp(y)     % Error, la variable 'y' no existe
    end
end
% Función local: Definida dentro del .m pero después del 'end' que cierra
% la función padre.
% Función anidada: Definida dentro de la función padre, antes del 'end' que
% cierra. Puede usar las variables de la función padre sin pasarlas como
% argumento.

%% Funciones anónimas
% Si quiero una función 'rápida' que no necesito guardar en un archivo .m,
% y que solo quiero llamar por medio de un handle... (debe tener solo una
% línea).

% Nota: Si quiero un script rápido, puedo usar shortcuts...

function otras  % Para qué se agrega esta línea?
% Rta/: 

% O puedo definir también:
s = @(x) sin(1./x);
% O
my_function = @(x,y) (x^2 + y^2 + x*y);

% (Para los interesados) Ver en la ayuda:
% Multiple Anonymous Functions
% The expression in an anonymous function can include another anonymous function. This is useful for passing different parameters to a function that you are evaluating over a range of values.

% Ejercicio: Escriba una función anónima para pasar una velocidad de m/s a km/h

%% Variables
% Una variable normalmente pertenece a un workspace (o a una función)

% Se pueden crear variables de tipo 'persistent' y 'global'

global a b c d % Permite usar las variables sean vistas desde cualquier función.
persistent m n p % Permite usar la misma variable en cada nuevo llamado de una función

%% Varargin, Varargout, nargin, nargout
% Estas palabras clave en Matlab, se refieren a:
% varargin: Una celda que guarda un número variable de argumentos de entrada
% varargout: Una celda que guarda un número variable de argumentos de salida
% nargin: un número variable de argumentos de entrada
% nargout: un número variable de argumentos de salida

% Ejemplo 1:
function varlist2(X,Y,varargin)
   fprintf('Total number of inputs = %d\n',nargin);

   nVarargs = length(varargin);
   fprintf('Inputs in varargin(%d):\n',nVarargs)
   for k = 1:nVarargs
      fprintf('   %d\n', varargin{k})
   end
end

% Ejemplo 2:
function c = addme(a,b)

switch nargin
    case 2
        c = a + b;
    case 1
        c = a + a;
    otherwise
        c = 0;
end
end
fx = 'addme';
nargin(fx)

%% return
% Esta palabra obliga a Matlab a volver el control del programa a quien
% haya llamado la función, antes de terminar la función

% Ejercicios: 
% - Cree una función que si recibe:
%   - Un argumento (d), muestra el día que es hoy
%   - Dos argumentos: (d,m), muestra el día y el mes actual
%   - Tres argumentos: (d,m,a), muestra el día, el mes y el año actual

% - Invéntese un ejemplo en el cual deba usar una función que reciba un número variable de argumentos y
%   entregue un número variable de argumentos. Créela.
end
