%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 10: Procesamiento de texto

%% Uso de strfind, findstr, strrep
texto = 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que viv�a un hidalgo de los de lanza en astillero, adarga antigua, roc�n flaco y galgo corredor. Una olla de algo m�s vaca que carnero, salpic�n las m�s noches, duelos y quebrantos los s�bados, lentejas los viernes, alg�n palomino de a�adidura los domingos, consum�an las tres partes de su hacienda. El resto della conclu�an sayo de velarte, calzas de velludo para las fiestas con sus pantuflos de lo mismo, los d�as de entre semana se honraba con su vellori de lo m�s fino. Ten�a en su casa una ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza, que as� ensillaba el roc�n como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta a�os, era de complexi�n recia, seco de carnes, enjuto de rostro; gran madrugador y amigo de la caza. Quieren decir que ten�a el sobrenombre de Quijada o Quesada (que en esto hay alguna diferencia en los autores que deste caso escriben), aunque por conjeturas veros�miles se deja entender que se llama Quijana; pero esto importa poco a nuestro cuento; basta que en la narraci�n d�l no se salga un punto de la verdad.';
% �Cu�les posiciones devuelve strfind?
strfind(texto,'en')

% Compruebe si es case-sensitive
strfind(texto,'mancha')
strfind(texto,'Mancha')

% Adem�s, recibe un peque�o texto en celdas �cu�l es la salida 'a'?
a = strfind({'En un lugar de la Mancha';'de cuyo nombre no quiero acordarme'},'a')

% Para reemplazar caracteres se usa
strrep('En un lugar de la Mancha de cuyo nombre no quiero acordarme','a','A')
% �C�mo se har�a para borrar alg�n car�cter?

%% textscan
% Revise uno a uno el resultado de los siguientes comandos:
archivo = fopen('Quijote_cap_1.txt','w');
fprintf(archivo,'%s',texto);%

archivo = fopen('Quijote_cap_1.txt');
C = textscan(archivo,'%s')
% Siempre se debe cerrar el archivo abierto
fclose(archivo)

% Ejercicio:
% Cree un archivo de texto que contenga los siguientes tipos de datos y
% l�alos con textscan:
% 09/12/2005 Level1 12.34 45 1.23e10 inf Nan Yes 5.1+3i
% 10/12/2005 Level2 23.54 60 9e19 -inf  0.001 No 2.2-.5i
% 11/12/2005 Level3 34.90 12 2e5   10  100   No 3.1+.1i

% Respuesta:
% fileID = fopen('scan1.dat');
% C = textscan(fileID,'%s %s %f32 %d8 %u %f %f %s %f');
% fclose(fileID);
% celldisp(C)



%% Regular expressions
% Leer:
doc regexp

