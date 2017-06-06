
%---------------------TORRE EIFFEL DE EJEMPLO--------------------------- 
%
% este programa lee las coordenadas de un archivo tipo GCODE y las grafica 
% una a una para la visualizaion de un objeto en tres dimenciones,  
%
%-----------------------------------------------------------------------
% puede esperar a que el programa termine 
% cuando en el Command Window diga :  
% 'SE HA TERMINADO DE LEER TODAS LAS COORDENADAS'
% esto puede llevar unos minutos segun el objeto 3D,
% o puede darle 'pause' al programa para ver el progreso de la figura 
%------------------------------------------------------------------------

clear; clf;clc;% limpiar
disp('EL PROGRAMA ESTA LEYENDO EL ARCHIVO...(Puede tardar unos minutos)');
%--------LEER ARCHIVO---------
fid = fopen('Torre.gcode','r'); % archivo tipo gcode 
Data = fread(fid);
charData = char(Data);
fclose(fid);
%-----------------------------
X=0;Y=0;Z=0; % variables para las coordenadas X,Y,Z
x1=0;y1=0;z1=0; cont=1;% trayectorias del cabezal de la impresora
caracter = 'AA'; % representa el comando 
i = 1; % posiciones
terminar =0; % bandera para terminar el programa
charTerminar = 'AAA'; % variable para verificar comando 'M84'
guia=0; % bandera para guia de usuario
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
         if( charData(i)=='Y')
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
             %disp('Z='); disp(Z);
         end     
        %-------------------------
  end
      i=i+1; 
 end   %while fin
   
     x1(cont)= X;
     y1(cont)= Y; 
     z1(cont)= Z; 
     cont=cont+1;
  
     hold on;
     %GRAFICA TODAS LAS COORDENADAS DEL OBJETO 3D
     plot3(X,Y,Z,'.');
     
%      se omite el nombrede los ejes para mayor velocidad
%      xlabel('Eje X');
%      ylabel('Eje Y');
%      zlabel('Eje Z');
     
     %DA UNA GUIA AL USUARI PARA VISUALIZAR EL OBJETO 3D
     if (0 == guia)
     dim = [0.158 0.9 0 0];
     texto = 'por favor use la herramienta : Rotate 3D y Maximice la figura';
     annotation('textbox',dim,'String',texto,'FitBoxToText','on');
     guia=1;
     end
     
     %GRAFICA TODAS LAS TRAYECTORIAS DEL CABEZAL DE LA IMPRESORA 3D
     %plot3(x1,y1,z1,'r'); 
     
   caracter(1) = 'A'; %reiniciar caracter 
   caracter(2) = 'A'; %reiniciar caracter 
end %while terminar   
    

