%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 10: Procesamiento de texto

%% Uso de strfind, findstr, strrep
texto = 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. Una olla de algo más vaca que carnero, salpicón las más noches, duelos y quebrantos los sábados, lentejas los viernes, algún palomino de añadidura los domingos, consumían las tres partes de su hacienda. El resto della concluían sayo de velarte, calzas de velludo para las fiestas con sus pantuflos de lo mismo, los días de entre semana se honraba con su vellori de lo más fino. Tenía en su casa una ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza, que así ensillaba el rocín como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta años, era de complexión recia, seco de carnes, enjuto de rostro; gran madrugador y amigo de la caza. Quieren decir que tenía el sobrenombre de Quijada o Quesada (que en esto hay alguna diferencia en los autores que deste caso escriben), aunque por conjeturas verosímiles se deja entender que se llama Quijana; pero esto importa poco a nuestro cuento; basta que en la narración dél no se salga un punto de la verdad.';
% ¿Cuáles posiciones devuelve strfind?
strfind(texto,'en')

% Compruebe si es case-sensitive
strfind(texto,'mancha')
strfind(texto,'Mancha')

% Además, recibe un pequeño texto en celdas ¿cuál es la salida 'a'?
a = strfind({'En un lugar de la Mancha';'de cuyo nombre no quiero acordarme'},'a')

% Para reemplazar caracteres se usa
strrep('En un lugar de la Mancha de cuyo nombre no quiero acordarme','a','A')
% ¿Cómo se haría para borrar algún carácter?

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
% léalos con textscan:
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

