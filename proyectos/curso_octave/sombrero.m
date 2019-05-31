clc %optativo si queres borrar todo lo anterior de la pantalla
clear all %clear all es lo que va siempre

tx = ty = linspace (-8, 8, 100)'; % genero un set de 100 muestras equiespaciadas del -8 al 8.
                                  %entiende que se declaran dos variables con igual valor, no como en otros lenguajes.
                                  %buenas practicas: no hacer esto, hacerlos por separado.
                                  
[xx, yy] = meshgrid (tx, ty); % que hace? https://la.mathworks.com/help/matlab/ref/meshgrid.html

r = sqrt (xx .^ 2 + yy .^ 2) + eps; %conjunto de muestras para z 
tz = sin (r) ./ r; %necesito darle la parametrizacion en z

meshc (tx, ty, tz); %si cambiamos por mesh no grafica las curvas de nivel abajo.
xlabel ("tx"); % eje y 
ylabel ("ty"); %eje x
zlabel ("tz"); %eje z
title ("Sombrero plot"); %titulo del grafico