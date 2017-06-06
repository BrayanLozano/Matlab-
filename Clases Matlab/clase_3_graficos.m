%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 3

%% Gráficas por interfaz gráfica

%% Gráficas por línea de comandos

x = 0:.1:100;
y = 10*exp(-x);
y = 10^(-x);
% ¿Qué está mal?
y = 10.^(-x);

plot(y)
% Qué hay en el eje x?

figure,axes
plot(x,y)

% Agregamos una señal aleatoria y graficamos 2 señales en los mismos ejes
y1 = y + rand(1,1001);
plot(x,y1)
hold on
plot(x,y)

% Función subplot
a = randn(1,10000);
figure
% Usamos subplot para crear varios ejes en la misma figura
subplot(221), hist(a,20) % hist = función para crear histogramas
subplot(223), plot([-x x],exp(-[-x x].^2),'r:o') % Uso de LineSpec para cambiar las propiedades de las líneas (ver doc plot)
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
% - En la misma figura hacer 3 gráficas:
%   1- Al lado derecho de la figura, graficar las posiciones x,y en unos ejes (use scatter)
%   2- En la parte superior izquierda, graficar los valores de x, con una línea punteada y con un marcador en forma de estrella de color rojo.
%   3- En la parte inferior izquierda, graficar los valores de y, con una línea discontinua y con un marcador en forma de círculo de color negro.

%% Objetos gráficos y propiedades

subplot(212),[h1,h2] = plotyy(x,y,x,10*y1); %Asigno las líneas que grafico, a los handles h1 y h2
% Qué es un handle? el identificador que guarda las propiedades de un
% objeto.

h1 = figure, ax1 = axes
% Ver propiedades

figure
groot % Objeto gráfico principal (de mayor jerarquía)
h = get(groot,'CurrentFigure')
% Los objetos tienen 'hijos'
h.Children
% ¿Qué respuesta da?
axes
ax = h.Children
% Qué otros objetos pueden tener hijos?
delete(ax) % borra el objeto (equivalente a borrarlo gráficamente o cerrar la figura)
subplot(211),[l1,l2] = plot(x,y,x,y1)
legend
subplot(212)
% Ejercicios
% Para la gráfica anteriormente creada (3 ejes en la misma figura)
% - Cambie la escala del eje x de la parte superior izquierda a logarítmica.
% - Cambie el tamaño de la figura para que quede en una relación 16:4 (ancho:alto).
% - Agregue nombres a las líneas graficadas