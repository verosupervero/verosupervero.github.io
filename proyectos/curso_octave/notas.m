clc
notas = floor(10*rand(1,5)); % notas aleatorias
cantidad=size(notas,2);
total = 0;
for i=1:cantidad
   total+= notas(i);
endfor
promedio = floor(total/cantidad)