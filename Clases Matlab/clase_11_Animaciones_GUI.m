%% - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
%- Clase 11: Animaciones e Interfaces gráficas
%% Animaciones

%% Axes Limit Mode
figure, axes
plot(.1,.1,'*') 
get(gca,'XLimMode') % axis('manual')
set(gca,'XLimMode','manual') % Aunque uno ajuste el modo a 'manual'
plot(.1,.2,'*') 
get(gca,'ALimMode') % después de usar plot, siempre se vuelve 'auto'

%% Usar hold on
hold on
h = plot(0,0,'b*');
for i = 1:10
    delete(h)   % Y borrar el objeto dibujado
    h = plot(i/10,i/sqrt(10*i),'b*');
    pause(.5)
end

%% Usando linkdata
x = 0; y = 0;
f = figure;
plot(x,y,'bo');
linkdata
for i = 1:10
    x = i/10; y = i/sqrt(10*i);
    pause(.5)
    refreshdata
end

%% O usar drawnow y animatedline
cla     % Clear axes
h = animatedline;   % Crea un objeto tipo animatedline
axis([0,4*pi,-1,1]) % Establece los límites del current axes

x = linspace(0,4*pi,1000);
y = sin(x);
for k = 1:length(x)     % Agrega puntos al objeto animatedline y redibuja
    addpoints(h,x(k),y(k));
    drawnow
end

%% Si quiero hacer una animación complicada...
% Se pueden cambiar las propiedades de los objetos en cada iteración...
cla
hold on
h = NaN*ones(1,100);
h(1) = plot(0,0,'bo'); axis([-.1 1.5 -.1 1.5])
set(h(1),'MarkerFaceColor','b')
set(h(1),'MarkerSize',12)
set(h(1),'MarkerEdgeColor','b')
M(1) = getframe;    % Captura el frame de todo lo que hay en el current figure

% Hacemos un ciclo para capturar ciclo por ciclo cada cambio en la imagen
for i = 2:100
    h(i) = plot(i/100,i/sqrt(100*i),'bo');
    set(h(i),'MarkerFaceColor','b')
    set(h(i),'MarkerSize',12)
    set(h(i),'MarkerEdgeColor','b')
    for j = 1:i-1
        tmp = get(h(j),'MarkerFaceColor') + [1/100 1/100 0];
        set(h(j),'MarkerFaceColor',tmp)
        tmp1 = get(h(j),'MarkerEdgeColor') + [1/100 1/100 0];
        set(h(j),'MarkerEdgeColor',tmp1)
        tmp2 = get(h(j),'MarkerSize')-1/10;
        set(h(j),'MarkerSize',tmp2)
    end
    pause(0.2)
    M(i) = getframe;
end

% Reproducción de la animación a la velocidad deseada
movie(M,1,100)

%% Image manipulation
% imshow	Display image
% imshow('peppers.png');
RGB = imread('peppers.png');
I = rgb2gray(RGB);
% Image
image(I)
image(RGB)
% [X,map] = imread('corn.tif');
% imshow(X,map)
C = imread('ngc6543a.jpg');
image(C)

% Proyectar una imagen debajo de una superficie 3D
Z = 10 + peaks;
surf(Z)
hold on
image(Z,'CDataMapping','scaled')

% Funciones adicionales
% image	Display image from array
% imagesc	Scale data and display image object
% imread	Read image from graphics file
% imwrite Write image to graphics file
%% Funciones para consultar
% refreshdata im2frame frame2im

%% Profiler

%% GUI
% Doc: 
% - Create a Simple UI Using GUIDE
% - Create a Simple UI Programmatically
% - UI Design References