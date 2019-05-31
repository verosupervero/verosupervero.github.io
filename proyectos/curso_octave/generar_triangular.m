% Función para generar muestras de una variable aleatoria con distribución
% triangular en [-a, a] usando el método de superposicion
function [] = generar_triangular(N, a)
% Parámetros
% N: Número de muestras
% a: Parámetro de la distribución triángulo

close all;
x1 = a*(rand(1,N)-0.5); % uniforme en [-a/2, +a/2]
x2 = a*(rand(1,N)-0.5); % uniforme en [-a/2, +a/2]

% Mostramos histograma de x1
figure
hist(x1,100)
title('Uniforme X_1')

% Mostramos histograma de x1
figure
hist(x2,100)
title('Uniforme X_2')

x = x1 + x2; % suma de uniformes independientes

% Mostramos histograma del resultado
figure
hist(x,100)
title('X_1+X_2')

end