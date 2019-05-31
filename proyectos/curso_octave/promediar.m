function promediar(archivo_notas)
  
  %LEEMOS EL ARCHIVO DE NOTAS Y LAS CARGAMOS EN UNA MATRIZ
  notas= csvread(archivo_notas);
  
  %VEMOS CUANTOS ALUMNOS Y CUANTAS NOTAS HAY
  cantidad_notas=size(notas,1);
  cantidad_alumnos=size(notas,2)
  
  %EN PRINCIPIO APROBAMOS A TODOS POR DEFECTO DE COPADOS
  aprobados=ones(1,cantidad_alumnos);
  
  
  %EMPEZAMOS A BOCHAR GENTE
    
  for i=1:cantidad_alumnos
    
    %CONDICION DE QUE ALGUNA SEA MENOR A 4
    notas_alumno=notas (:,i)
    notas_menores_a_cuatro= notas_alumno(notas_alumno< 4);
    
    if (numel(notas_menores_a_cuatro)>0)
      aprobados(i)=0;
    endif
    
    %ME FIJO QUE EL PROMEDIO DE CADA UNO SEA MAYOR A 7
    if(mean(notas)(i) <7)
      aprobados(i)=0;
    endif
    
  endfor

 end