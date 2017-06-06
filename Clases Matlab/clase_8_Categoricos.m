% % - Matlab: Herramienta de tecnolog�a
% Daniel Jaramillo R, 2016
% - Clase 8

%% Datos Categ�ricos
% Los datos categ�ricos, son especialmente �ltiles para manejar informaci�n
% de variables discretas o percepciones humanas de un rango de datos.

% �Cu�l es la diferencia entre:
Temp1 = {'fr�o', 'caliente', 'templado'};
% y 
Temp2 = categorical({'fr�o', 'caliente', 'templado'});
% ?

% Tenemos el siguiente arreglo categ�rico (T):
temperatura = {'fr�o', 'templado', 'caliente','fr�o'};
T = categorical(temperatura);
% Y a ese arreglo podemos verle las categor�as:
categories(T) % En qu� orden aparecen las categor�as?

%% Datos categ�ricos ordinales
% Las categor�as, adem�s pueden tener un orden especificado
valueset = {'fr�o', 'templado', 'caliente'};
T = categorical(temperatura,valueset,'Ordinal',true);
categories(T) % En qu� orden aparecen las categor�as?
% Si las categor�as tienen un orden, podemos hacer comparaciones l�gicas
% entre ellas, por ejemplo:
T(1:2) < T(3:4) % �Qu� significa el resultado?

%% Variables n�mericas discretas
% Pueden ser convertidas a valores intuitivos y f�ciles de recordar, por
% ejemplo:
A = randi(3,10,1)
% Supongamos que esos n�meros hacen referencia a las bebidas favoritas de
% 10 personas, entonces usamos datos categ�ricos:
A = categorical(A,1:3,{'ponymalta', 'jugo', 'agua'})
% Los datos categ�ricos se pueden combinar con otros, por ejemplo:
B = randi(4,10,1);
B = categorical(B,1:4,{'ponymalta', 'jugo', 'agua', 'tampico'})
% Los arreglos A y B se pueden combinar, observe los resultados:
[A B]
summary([A B])
% y
[A; B]
summary([A; B])

%% Variables num�ricas continuas
% Pueden ser 'discretizadas' y convertidas en rangos de categor�as.
% Suponga que tienen los siguientes valores de estatura:
est = 15*randn(10,1) + 170
% Y queremos convertirlos en datos categ�ricos. Para esto, tenemos que
% 'discretizarlos', as�:
nombres_cat = {'baja' 'media' 'alta'};
est_cat = discretize(est,[150 165 180 200],'categorical',nombres_cat);

%% Gr�ficas con datos categ�ricos
% (hist, pie, scatter)
load patients
L = categorical(Location);
summary(L)

S = categorical(SelfAssessedHealthStatus,...
{'Poor','Fair','Good','Excellent'},'Ordinal',true);
summary(S)

hist(S)
pie(S)

hist(L(S<='Fair')),title('Ubicaci�n de pacientes que se sienten regular o mal')

%% Funciones adicionales
% categorical	Create categorical array
% iscategorical	Determine whether input is categorical array
% categories	Categories of categorical array
% iscategory	Test for categorical array categories
% isordinal     Determine whether input is ordinal categorical array
% isprotected	Determine whether categories of categorical array are protected
% addcats       Add categories to categorical array
% mergecats     Merge categories in categorical array
% removecats	Remove categories from categorical array
% renamecats	Rename categories in categorical array
% reordercats	Reorder categories in categorical array
% setcats       Set categories in categorical array
% summary       Print summary of table or categorical array
% countcats     Count occurrences of categorical array elements by category
% isundefined	Find undefined elements in categorical array


% Ejercicios:
% - Tome de internet un conjunto de datos num�ricos discretos y
% convi�rtalos en categ�ricos. Grafique el diagrama de torta.
% - Tome de internet un conjunto de datos continuos y convi�rtalos en
% categ�ricos. Muestre el histograma de los datos num�ricos vs el de los
% categ�ricos. Cu�l es mejor?
% - Ahora haga estos datos ordinales.
% - Lea los ejemplos de la ayuda: 
%     - 'Combine Categorical Arrays Using Multiplication'
%     - 'Plot Categorical Data'
% - Entre en la p�gina: http://plebiscito.registraduria.gov.co/
% y haga la mejor gr�fica posible para explicar el resultado del plebiscito
% usando datos cate�ricos.
