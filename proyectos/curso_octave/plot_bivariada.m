 close all;
 clear all;
 clc;
 
 %PARAMETROS DE LA NORMAL BIVARIADA
 mu = [0, 0]; %media de la normal bivariada (esperanza)
 sigma = [1, 0.1; 0.1, 0.5]; %matriz de covarianza
 
 %GENERACION DE MUESTRAS
 inicio=-10;
 fin=10;
 cantidad_muestras=100;
 muestras= linspace(inicio, fin, cantidad_muestras);
 
 [X, Y] = meshgrid (muestras); %set de muestras que quiero plotear, me devuelve dos matrices
 coordenadas = [X(:), Y(:)];
 
 Z = normal_bivariada (coordenadas, mu, sigma); %coordenadas en eje Z
 
 %PLOTEO DE LA NORMAL BIVARIADA
 
 posicion_pantalla= [400 400];
 tamanio_imagen=[600 600];
 figure(1, 'position',[posicion_pantalla,tamanio_imagen]);
 subplot(2,1,1)
 %mesh (X, Y, Z); %dibuja la funcion sin las curvas de nivel abajo (con meshc pone curvas de nivel)
 surf (X, Y, Z); %hace el grafico pintado de superficie
 
 %OPCIONES PARA MOSTRAR NORMAL EN PANTALLA:
 colormap jet %probar colormap hot , colormap spring, colormap summer
 
 %CONTROL DE LOS EJES
 eje_x=[-3 8];
 eje_y=[-2 3];
 ejes=[eje_x eje_y];
 axis(ejes);

 %ETIQUETAS:
 ylabel('y')
 xlabel('x')
 zlabel('z')
 legend('Normales Bivariadas','location','northwest') %en la esquina superior izquierda
 title ("Acá es el titulo: Normales Bivariadas");

 
 %SEGUNDA NORMAL
 mu2= [5, 1];
 sigma2 = [1, 0.3; 0.3, 0.7];
 Z2 = normal_bivariada (coordenadas, mu2, sigma2);
 hold on;
 %mesh (X, Y, Z2);
 surf (X, Y, Z2); %hace el grafico pintado de superficie

 %GRAFICO CURVAS DE NIVEL
 
 subplot(2,1,2) %descomentar figure y comentar ambos subplots para graficos separados
 %figure 
 contour(X, Y, Z);
 hold on;
 contour(X, Y, Z2);
 ylabel('y')
 xlabel('x')
 grid minor;
 title ("Curvas de nivel de las normales bivariadas");
 axis(ejes)

 %EXPORTAR IMAGEN A ARCHIVO
 graphics_toolkit("gnuplot")
 print('normales_bivariadas.png','-dpng','-r300');