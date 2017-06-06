
function varargout = Simulacion(varargin)

% SIMULACION MATLAB code for Simulacion.fig
%      SIMULACION, by itself, creates a new SIMULACION or raises the existing
%      singleton*.
%
%      H = SIMULACION returns the handle to a new SIMULACION or the handle to
%      the existing singleton*.
%
%      SIMULACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULACION.M with the given input arguments.
%
%      SIMULACION('Property','Value',...) creates a new SIMULACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Simulacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Simulacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Simulacion

% Last Modified by GUIDE v2.5 28-May-2017 20:12:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Simulacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Simulacion_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Simulacion is made visible.
function Simulacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Simulacion (see VARARGIN)

% Choose default command line output for Simulacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Simulacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Simulacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global charData;
FileName = uigetfile('*.gcode','Select the Gcode code file');
disp(FileName);
%--------LEER ARCHIVO---------
fid = fopen(FileName,'r'); % archivo tipo gcode 
Data = fread(fid);
charData = char(Data);
fclose(fid);
%-----------------------------

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%-----------------------------
global charData;
global A1;
global A2;
global A3;
global A4;

X=0;Y=0;Z=0; % variables para las coordenadas X,Y,Z
x1=0;y1=0;z1=0; cont=1;% trayectorias del cabezal de la impresora
caracter = 'AA'; % representa el comando 
i = 1; % posiciones
terminar =0; % bandera para terminar el programa
charTerminar = 'AAA'; % variable para verificar comando 'M84'
guia=0; % bandera para guia de usuario
rotate3d on
v=1; v2=1; f=1;
%------------------------
Extruir = 0;
V2 = [];
x2=0;y2=0;z2=0;
while (terminar == 0)    
%------------BUSCAR COMANDO G1---------------
while (caracter(1)~='G')&&(terminar == 0)
    
    charTerminar(1)= charData(i);
    charTerminar(2)= charData(i+1);
    charTerminar(3)= charData(i+2);
    if (charTerminar == 'M84') % EL COMANDO 'M84' TERMINA EL PROGRAMA
        terminar = 1; 
        disp('SE HA TERMINADO DE LEER TODAS LAS COORDENADAS'); 
    end  
    %-----------------------
    caracter(1) = charData(i); 
    caracter(2) = charData(i+1); 
    if (caracter(1)=='G')&&(caracter(2)=='1')
        i=i-1;
    else
        caracter(1) = 'A'; %reiniciar caracter 
        caracter(2) = 'A'; %reiniciar caracter 
    end 
    i=i+1;
end 
%----------------------------------------------
if (terminar == 1)
    break;  % termina el while principal
end
%----------------------------------------------
fin = 'NO'; %bandera para salir del while(fin == 'NO')
fin2 = 'AA';
Extruir=0;
while (fin == 'NO') % while para el fin de una linea en el archivo
    fin2(1) = charData(i);
    fin2(2) = charData(i+1); 
    ascii = double(fin2);    % ascii de la cadena fin2
    if (ascii(1)==13)% numero ascii de retorno de carro: 13
       if (ascii(2)==10) % numero ascii de salto de linea: 10
          fin='SI';
       end
    end
    
  if (caracter == 'G1') %LEER COORDENADAS
    a='A'; % inicializar 
    b='A'; % inicializar 
    
        %-------COORDENADAS X-------
         if( charData(i)=='X')
             i=i+1;
             a = charData(i); i=i+1;
             while (charData(i) ~= ' ')
              
                 b = charData(i); 
                 a = cat(2,a,b);
                 X= str2num(a);
                 i=i+1;   
             end
             i=i-1; 
             %disp('X='); disp(X);
         end
         %-------COORDENADAS Y-------
         if(charData(i)=='Y')
             i=i+1;
             a = charData(i); i=i+1;
             while (charData(i) ~= ' ')
              
                 b = charData(i); 
                 a = cat(2,a,b);
                 Y = str2num(a);
                 i=i+1;   
             end
             i=i-1;
             %disp('Y='); disp(Y);
         end
         %-------COORDENADAS Z-------
         if( charData(i)=='Z')
             i=i+1;
             a = charData(i); i=i+1;
             while (charData(i) ~= ' ')
              
                 b = charData(i); 
                 a = cat(2,a,b);
                 Z = str2num(a);
                 i=i+1;   
             end
             i=i-1;
         end     
        %-------------------------
        
        %----------EXTRUSOR DE PLASTICO----------
        if( charData(i)=='E')
            Extruir = 1;
        end
        %-------------------------
  end
      i=i+1; 
 end   %while fin
     %guarda todas las coordenadas en arreglos x1 y1 y2
     x1(cont)= X;
     y1(cont)= Y; 
     z1(cont)= Z; 
     
     % guarda la coordenada anterior
     if cont>=2
     x2 = x1(cont-1);
     y2 = y1(cont-1);
     z2 = z1(cont-1);
     end
     % asigna las 2 ultimas coordenadas a Xp Yp Zp (P representa plot)
     Xp=[x2 X];
     Yp=[y2 Y];
     Zp=[z2 Z];  
     cont=cont+1;
     
     hold on;
    % nombrede los ejes 
     xlabel('Eje X');
     ylabel('Eje Y');
     zlabel('Eje Z');
     
     %GRAFICA TODAS LAS TRAYECTORIAS DEL CABEZAL DE LA IMPRESORA 3D
     if Extruir == 1
     plot3(Xp,Yp,Zp,'r')
     pause(0.1);
     v=v+1;
     end
     % OPTENER FRAME DE LA FIGURA (Animacion 1)
     view([45 45 45])
     if (v>=10)
     pause(0.1);
     M1(f) = getframe;f=f+1;
     A1=M1;
     end
     %-----  
     caracter(1) = 'A'; %reiniciar caracter 
     caracter(2) = 'A'; %reiniciar caracter 
   
end %while terminar  
disp('fin animacion 1');
%Animacion 2----------------
view([45 45 45]);
for q=1:100
    view([q 45 45]);
    M2(q) = getframe();
end
A2=M2;
disp('fin animacion 2');
%Animacion 3-----------------
view([45 45 45]);
for q=1:100
    view([45 q 45]);
    M3(q) = getframe;
end
A3=M3;
disp('fin animacion 3');
%Animacion 4----------------
view([45 45 45]);
for q=1:100
    view([q q 45]);
    M4(q) = getframe;
end
A4=M4;
disp('fin animacion 4');
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A1;
%Animacion 1-----------
movie(A1,1,100,[450 0 0 0])

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A2
%Animacion 2----------------
movie(A2,1,100,[450 0 0 0])

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A3
%Animacion 3-----------------
movie(A3,1,100,[450 0 0 0])

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A4
%Animacion 4----------------
movie(A4,1,100,[450 0 0 0])
