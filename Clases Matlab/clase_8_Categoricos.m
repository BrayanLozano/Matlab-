% % - Matlab: Herramienta de tecnología
% Daniel Jaramillo R, 2016
% - Clase 8

%% Datos Categóricos
% Los datos categóricos, son especialmente últiles para manejar información
% de variables discretas o percepciones humanas de un rango de datos.

% ¿Cuál es la diferencia entre:
Temp1 = {'frío', 'caliente', 'templado'};
% y 
Temp2 = categorical({'frío', 'caliente', 'templado'});
% ?

% Tenemos el siguiente arreglo categórico (T):
temperatura = {'frío', 'templado', 'caliente','frío'};
T = categorical(temperatura);
% Y a ese arreglo podemos verle las categorías:
categories(T) % En qué orden aparecen las categorías?

%% Datos categóricos ordinales
% Las categorías, además pueden tener un orden especificado
valueset = {'frío', 'templado', 'caliente'};
T = categorical(temperatura,valueset,'Ordinal',true);
categories(T) % En qué orden aparecen las categorías?
% Si las categorías tienen un orden, podemos hacer comparaciones lógicas
% entre ellas, por ejemplo:
T(1:2) < T(3:4) % ¿Qué significa el resultado?

%% Variables númericas discretas
% Pueden ser convertidas a valores intuitivos y fáciles de recordar, por
% ejemplo:
A = randi(3,10,1)
% Supongamos que esos números hacen referencia a las bebidas favoritas de
% 10 personas, entonces usamos datos categóricos:
A = categorical(A,1:3,{'ponymalta', 'jugo', 'agua'})
% Los datos categóricos se pueden combinar con otros, por ejemplo:
B = randi(4,10,1);
B = categorical(B,1:4,{'ponymalta', 'jugo', 'agua', 'tampico'})
% Los arreglos A y B se pueden combinar, observe los resultados:
[A B]
summary([A B])
% y
[A; B]
summary([A; B])

%% Variables numéricas continuas
% Pueden ser 'discretizadas' y convertidas en rangos de categorías.
% Suponga que tienen los siguientes valores de estatura:
est = 15*randn(10,1) + 170
% Y queremos convertirlos en datos categóricos. Para esto, tenemos que
% 'discretizarlos', así:
nombres_cat = {'baja' 'media' 'alta'};
est_cat = discretize(est,[150 165 180 200],'categorical',nombres_cat);

%% Gráficas con datos categóricos
% (hist, pie, scatter)
load patients
L = categorical(Location);
summary(L)

S = categorical(SelfAssessedHealthStatus,...
{'Poor','Fair','Good','Excellent'},'Ordinal',true);
summary(S)

hist(S)
pie(S)

hist(L(S<='Fair')),title('Ubicación de pacientes que se sienten regular o mal')

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
% - Tome de internet un conjunto de datos numéricos discretos y
% conviértalos en categóricos. Grafique el diagrama de torta.
% - Tome de internet un conjunto de datos continuos y conviértalos en
% categóricos. Muestre el histograma de los datos numéricos vs el de los
% categóricos. Cuál es mejor?
% - Ahora haga estos datos ordinales.
% - Lea los ejemplos de la ayuda: 
%     - 'Combine Categorical Arrays Using Multiplication'
%     - 'Plot Categorical Data'
% - Entre en la página: http://plebiscito.registraduria.gov.co/
% y haga la mejor gráfica posible para explicar el resultado del plebiscito
% usando datos cateóricos.
