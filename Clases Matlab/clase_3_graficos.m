%% - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
%- Clase 3

%% Gr�ficas por interfaz gr�fica

%% Gr�ficas por l�nea de comandos

x = 0:.1:100;
y = 10*exp(-x);
y = 10^(-x);
% �Qu� est� mal?
y = 10.^(-x);

plot(y)
% Qu� hay en el eje x?

figure,axes
plot(x,y)

% Agregamos una se�al aleatoria y graficamos 2 se�ales en los mismos ejes
y1 = y + rand(1,1001);
plot(x,y1)
hold on
plot(x,y)

% Funci�n subplot
a = randn(1,10000);
figure
% Usamos subplot para crear varios ejes en la misma figura
subplot(221), hist(a,20) % hist = funci�n para crear histogramas
subplot(223), plot([-x x],exp(-[-x x].^2),'r:o') % Uso de LineSpec para cambiar las propiedades de las l�neas (ver doc plot)
subplot(222), plot([-x x],exp(-[-x x].^2),'r:o')

% Funciones axis y plotyy
axis
% Resultado?
axis([-10 10 0 1])
subplot(212),plotyy(x,y,x,10*y1)
% cambios de ejes
axis([0 10 0 10])
axis([0 5 0 15])
help axis

% Ejercicios
x = rand(1,10);
y = rand(1,10);
% - En la misma figura hacer 3 gr�ficas:
%   1- Al lado derecho de la figura, graficar las posiciones x,y en unos ejes (use scatter)
%   2- En la parte superior izquierda, graficar los valores de x, con una l�nea punteada y con un marcador en forma de estrella de color rojo.
%   3- En la parte inferior izquierda, graficar los valores de y, con una l�nea discontinua y con un marcador en forma de c�rculo de color negro.

%% Objetos gr�ficos y propiedades

subplot(212),[h1,h2] = plotyy(x,y,x,10*y1); %Asigno las l�neas que grafico, a los handles h1 y h2
% Qu� es un handle? el identificador que guarda las propiedades de un
% objeto.

h1 = figure, ax1 = axes
% Ver propiedades

figure
groot % Objeto gr�fico principal (de mayor jerarqu�a)
h = get(groot,'CurrentFigure')
% Los objetos tienen 'hijos'
h.Children
% �Qu� respuesta da?
axes
ax = h.Children
% Qu� otros objetos pueden tener hijos?
delete(ax) % borra el objeto (equivalente a borrarlo gr�ficamente o cerrar la figura)
subplot(211),[l1,l2] = plot(x,y,x,y1)
legend
subplot(212)
% Ejercicios
% Para la gr�fica anteriormente creada (3 ejes en la misma figura)
% - Cambie la escala del eje x de la parte superior izquierda a logar�tmica.
% - Cambie el tama�o de la figura para que quede en una relaci�n 16:4 (ancho:alto).
% - Agregue nombres a las l�neas graficadas