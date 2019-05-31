function promocionados=promocionar(archivo_notas)
  clc;  %NOTA: no le podemos dar clear all a una funcion que recibe parametros porque los borra
  
  %LEEMOS EL ARCHIVO DE NOTAS Y LAS CARGAMOS EN UNA MATRIZ
  lista_notas= csvread(archivo_notas);
  
  %VEMOS CUANTOS ALUMNOS Y CUANTAS NOTAS HAY
  cantidad_alumnos=length(lista_notas)
  printf("CANTIDAD DE GENTE EN EL CURSO: %f\n",cantidad_alumnos);
  
  %EN PRINCIPIO NADIE PROMOCIONA
  promocionados=0;
    
  for i=1:cantidad_alumnos
    printf("ALUMNO: %d\n",i);

    notas_alumno=lista_notas (i,:) % agarra la fila i(alumno i) y todas las notas(columnas)
    notas_menores_a_cuatro= notas_alumno(notas_alumno< 4);
    cantidad_notas_menores_a_cuatro=numel(notas_menores_a_cuatro)
    
    promedio_nota_alumno=ceil(mean(lista_notas,2)(i))
    
    %TODAS MAYORES A CUATRO Y PROMEDIO MAYOR A 7
    promociona= cantidad_notas_menores_a_cuatro==0 && promedio_nota_alumno>=7
    if (promociona)
      promocionados+=1;
    endif
    printf("----------------------\n");
  end
  printf("CANTIDAD DE GENTE PROMOCIONADA: %d\n",promocionados);
 end