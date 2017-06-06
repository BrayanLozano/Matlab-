%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 5

%% Funciones

% �Cu�ndo debo utilizar una funci�n y cu�ndo un script?
% Rta:
% Caracter�stica principal: CADA FUNCI�N TIENE SU PROPIO WORKSPACE

% Notaciones:
% function clase_semana_5 % Funci�n sin argumentos (es un script)
% function clase_semana_5(in_1,in_2)  % Funci�n con argumentos de entrada

% Funci�n con argumentos de entrada y salida
function [out_1,out_2] = clase_semana_5(in_1,in_2)
y = 0;
% Solo es necesario cerrar la funci�n con 'end' si hay varias funciones en
% un mismo archivo .m
end
% Nota: una funci�n debe llamarse igual que su archivo .m

%% Funciones locales o anidadas (local or nested)

function mi_funcion
    disp('esta es mi funci�n')
    x = 1;
    % mi_funcion queda definida como una funci�n local de la funci�n clase_semana_5
    function fcn_anidada
        disp(x)
        disp(y)     % Error, la variable 'y' no existe
    end
end
% Funci�n local: Definida dentro del .m pero despu�s del 'end' que cierra
% la funci�n padre.
% Funci�n anidada: Definida dentro de la funci�n padre, antes del 'end' que
% cierra. Puede usar las variables de la funci�n padre sin pasarlas como
% argumento.

%% Funciones an�nimas
% Si quiero una funci�n 'r�pida' que no necesito guardar en un archivo .m,
% y que solo quiero llamar por medio de un handle... (debe tener solo una
% l�nea).

% Nota: Si quiero un script r�pido, puedo usar shortcuts...

function otras  % Para qu� se agrega esta l�nea?
% Rta/: 

% O puedo definir tambi�n:
s = @(x) sin(1./x);
% O
my_function = @(x,y) (x^2 + y^2 + x*y);

% (Para los interesados) Ver en la ayuda:
% Multiple Anonymous Functions
% The expression in an anonymous function can include another anonymous function. This is useful for passing different parameters to a function that you are evaluating over a range of values.

% Ejercicio: Escriba una funci�n an�nima para pasar una velocidad de m/s a km/h

%% Variables
% Una variable normalmente pertenece a un workspace (o a una funci�n)

% Se pueden crear variables de tipo 'persistent' y 'global'

global a b c d % Permite usar las variables sean vistas desde cualquier funci�n.
persistent m n p % Permite usar la misma variable en cada nuevo llamado de una funci�n

%% Varargin, Varargout, nargin, nargout
% Estas palabras clave en Matlab, se refieren a:
% varargin: Una celda que guarda un n�mero variable de argumentos de entrada
% varargout: Una celda que guarda un n�mero variable de argumentos de salida
% nargin: un n�mero variable de argumentos de entrada
% nargout: un n�mero variable de argumentos de salida

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
% haya llamado la funci�n, antes de terminar la funci�n

% Ejercicios: 
% - Cree una funci�n que si recibe:
%   - Un argumento (d), muestra el d�a que es hoy
%   - Dos argumentos: (d,m), muestra el d�a y el mes actual
%   - Tres argumentos: (d,m,a), muestra el d�a, el mes y el a�o actual

% - Inv�ntese un ejemplo en el cual deba usar una funci�n que reciba un n�mero variable de argumentos y
%   entregue un n�mero variable de argumentos. Cr�ela.
end
