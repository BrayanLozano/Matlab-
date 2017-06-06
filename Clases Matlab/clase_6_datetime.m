%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 6

%% Tipos de datos: Numeric, Char/String, Dates/Time, Cells
% Otros tipos de datos que veremos son: Tables y Structures
% Otros que no veremos: Time series, Map Containers

%% Numeric
% Los n�meros pueden almacenarse en muchos tipos de datos: double, single,
% int8, ... int64, uint8 ... uint64

% Algunas funciones para pasar datos de un tipo a otro son
% double	Convert to double precision
% single	Convert to single precision
% int8	Convert to 8-bit signed integer
% int16	Convert to 16-bit signed integer
% int32	Convert to 32-bit signed integer
% int64	Convert to 64-bit signed integer
% uint8	Convert to 8-bit unsigned integer
% uint16	Convert to 16-bit unsigned integer
% uint32	Convert to 32-bit unsigned integer
% uint64	Convert to 64-bit unsigned integer

% Otras funciones

% cast	Cast variable to different data type
% typecast	Convert data types without changing underlying data
% isinteger	Determine if input is integer array
% isfloat	Determine if input is floating-point array
% isnumeric	Determine if input is numeric array
% isreal	Determine whether array is real
% isfinite	Array elements that are finite
% isinf     Array elements that are infinite
% isnan     Array elements that are NaN
% eps       Floating-point relative accuracy
% flintmax	Largest consecutive integer in floating-point format
% Inf       Infinity
% intmax	Largest value of specified integer type
% intmin	Smallest value of specified integer type
% NaN       Not-a-Number
% realmax	Largest positive floating-point number
% realmin	Smallest positive normalized floating-point number


%% Funciones usadas en arreglos de datos num�ricos

% cumprod	Cumulative product
% cumsum	Cumulative sum
% diff	Differences and Approximate Derivatives
% prod	Product of array elements
% sum     Sum of array elements
% 
% ceil      Round toward positive infinity
% fix       Round toward zero
% floor     Round toward negative infinity
% idivide	Integer division with rounding option
% mod       Remainder after division (modulo operation)
% rem       Remainder after division
% round     Round to nearest decimal or integer


%% Characters and strings
% Funciones comunes

% blanks	Create string of blank characters
% cellstr	Convert to cell array of strings
% char	 Convert to character array (string)
% iscellstr	Determine whether input is cell array of strings
% ischar	Determine whether item is character array
% sprintf	Format data into string
% strcat	Concatenate strings horizontally []
% strjoin	Join strings in cell array into single string

% Ejercicios:
% - �Qu� se obtiene al aplicar la funci�n char a los n�meros enteros del 1
% al 256?
% - Cree una matriz con varias palabras y use cellstr para convertirla en
% celda.
% - Tome la celda obtenida y aplique strjoin �qu� obtiene?
% - Tome nuevamente la celda y aplique strjoin con ', ' en el segundo
% argumento.
% - Ahora cambie el segundo argumento por una celda con varios caracteres,
% por ejemplo, si su celda de palabras tiene 3 elementos, en el segundo
% argumento de strjoin use una celda de 3-1 = 2 elementos: {'+',' = '}

%-- Otras funciones �tiles
% strcmp	Compare strings
% strcmpi	Compare strings (case insensitive)
% strncmp	Compare first n characters of strings (case sensitive)
% strncmpi	Compare first n characters of strings (case insensitive)
% strtrim	Remove leading and trailing white space from string
% lower	Convert string to lowercase
% upper	Convert string to uppercase
% strjust	Justify character array

%% Conversion de string-numeric
% char      Convert to character array (string)
% str2num   Convert string to number
% str2double  Convert string to double-precision value

% Ejercicio: Revisar los ejemplos de la ayuda de la funci�n char

%% Arreglo de n�meros y/o caracteres
% Estos arreglos pueden utilizar funciones de conjuntos:

% intersect	  Set intersection of two arrays
% ismember	  Array elements that are members of set array
% ismembertol	Set ismember within tolerance
% issorted	  Determine whether set elements are in sorted order
% setdiff     Set difference of two arrays
% setxor      Set exclusive OR of two arrays
% union       Set union of two arrays
% unique      Unique values in array
% uniquetol   Set unique within a tolerance

% Ejercicios: 
% - Cree dos vectores fila con letras repetidas. Aplique la funci�n union.
% - Los mismos dos vectores, convi�rtalos con cellstr
% - Los mismos dos vectores, pero en columna, convi�rtalos con cellstr y
% realice la uni�n de ambos con la funci�n union

%% Date & Time

%% Objetos datetime
% Matlab crea objetos tipo 'datetime'. Dichos objetos son muy �tiles para
% manejar fechas, horas y "distancias de tiempo"

% Ejecute los siguientes comandos:
% Usando d�as relativos
datetime %= datetime('now')
t = datetime('today')   
t = datetime('tomorrow','TimeZone','local','Format','d-MMM-y HH:mm:ss Z')

% Usando fechas
t = datetime('24-Oct-2014 12:45:07')
t = datetime({'15-Oct-2013' '20-Nov-2014'})
% Y fechas con diferentes formatos
DateStrings = {'2014-05-26';'2014-08-03'};
t1 = datetime(DateStrings,'InputFormat','yyyy-MM-dd')
t2 = datetime('yesterday','Format','eeee, MMMM d, yyyy h:mm a')
t3 = datetime('yesterday','Format','eeee, MMMM d, yyyy h:mm a') - days(7)

% Usando vectores
datetime(randi(10,1,3))
datetime(randi(10,1,6))
datetime(randi(10,1,5)) % �Qu� pasa?

% Usando diferentes arreglos de vectores
Y = [2014;2013;2012];
M = 01;
D = [31;30;31];
t = datetime(Y,M,D)
t = datetime(Y,M,D,'Format','eeee, MMMM d, y')

% C�mo representar fechas y horas
t = datetime(2014,6,28,6:7,0,0)
% �Qu� hacen estos comandos?
t.Day = 27:28
t.Format = 'MMM dd, yyyy'

t2 = datetime(2014,6,29,6,30,45)

%% Objetos 'duration'
d = t2 - t
% �Qu� tipo de dato es d?
whos d
% Un objeto duraci�n puede ser especificado en y, d, h, m, s, y sus combinaciones 
d.Format = 'h'
% Qu� diferencia hay entre:
d.Format = 'd'
days(d)

% Los objetos 'duration' se usan con las funciones:
% years, days, hours, minutes, seconds, milliseconds
d = days(2)
t = years(1) - days(10) + hours(5) + seconds(30)
x = datetime([ones(1,3) zeros(1,3)]) % �Esto qu� significa?
x + t  % �Qu� resultado obtiene?
% �Por qu� no existe la funci�n 'months'?

[h,m,s] = hms(t)    % �Resultado?
% Ejercicio: Cree una funci�n 'dhms' para obtener la duraci�n en d�as,
% horas, minutos y segundos de un objeto duraci�n, as�:
% [d,h,m,s] = dhms(t)

d = floor(days(t))
t - days(floor(days(t))) % �Qu� entrega?
[h,m,s] = hms(t - days(floor(days(t))))

% Tambi�n existen las funciones (cuya entrada es un 'datetime')
% year, quarter, month, week, day, hour, minute, second
% Ejercicio: �En qu� se diferencian de las anteriores?

%% Objetos calendarDuration
% Estos objetos representan lapsos de tiempo (duraciones) dependiendo del
% calendario (incluyen el n�mero de d�as en diferentes meses, los cambios
% de hora invierno/verano y a�os bisiestos.

% Tambi�n existen las funciones (entrada es un n�mero o un 'calendarDuration')
% calyears, calquarters, calmonths, calweeks, caldays
% Ejercicio: �En qu� se diferencian de las anteriores?

% Otras funciones interesantes (investigue)
calendar    % calendar(2001,11), c = calendar(2001,11)
datetick
split
time        % Convert time of calendar duration to duration
timeofday   % Convert time of datetime to duration 
isweekend
between
weekday     % Los d�as de la semana en todos los idiomas

% Para pasar las fechas a una escala de n�meros continuos se usa datenum
% Ejercicio: �Qu� hace el comando?
datenum(datetime)
% Revisar:
clock, now, tic, toc

%% Buenas pr�cticas:
% C�mo generar secuencias
t1 = datetime('01-Nov-2013 08:00:00');
t2 = datetime('05-Nov-2013 08:00:00');
t = t1:t2   
% Con diferentes intervalos
t = t1:caldays(2):t2
t = t1:hours(18):t2
d = 0:seconds(30):minutes(3)
% Agregar duraciones o duraciones de calendario
t = t1 + hours(0:2)

t = t1 + calmonths(1:5)
dt = caldiff(t)
% Ejercicio: C�mo saber cu�l es el �ltimo d�a de cada mes del a�o
% % % t = datetime('31-Jan-2014') + calmonths(0:11)

% Tambi�n se puede hacer
A = datetime(2014,04,14);
B = datetime(2014,08,04);
C = linspace(A,B,5)

% Ejercicio: �Qu� hacen estos comandos?
A = duration(1,0,0);
B = duration(5,30,0);
C = linspace(A,B,6)

% �C�mo encontrar, los pr�ximos 3 lunes?
t1 = datetime('today','Format','dd-MMM-yyyy eee')
t = dateshift(t1,'dayofweek','Monday',1:3)

% Ejercicio: �Qu� hacen estos comandos?
t1 = datetime(2014,04,01);
t = dateshift(t1,'start','month',0:4)
t = dateshift(t1,'end','month',0:2)

% Ejercicio: �Qu� hacen estos comandos?
t = datetime
t = dateshift(t1,'start','hour',-1:1)

%% Ejercicios:
% 1- Lea el ejemplo: Plot Dates and Durations
% 2- Haga un gr�fico 'L�nea de tiempo' de su vida, se�alando los eventos
% m�s importantes (puede usar por ejemplo la funci�n stem para la gr�fica)

%% Cells...