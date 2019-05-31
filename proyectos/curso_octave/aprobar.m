

function aprobados=aprobar(archivo_notas)

  RESET=  "\033[0m";;
  BLACK=  "\033[30m";
  RED=    "\033[31m";
  GREEN=  "\033[32m";

  %LEEMOS EL ARCHIVO DE NOTAS Y LAS CARGAMOS EN UNA MATRIZ
  lista_notas= csvread(archivo_notas);
  
  %VEMOS CUANTOS ALUMNOS SE PRESENTARON
  cantidad_alumnos=length(lista_notas);
  printf("CANTIDAD DE GENTE QUE SE PRESENTÓ AL EXAMEN: %d\n",cantidad_alumnos);
  
  %VEAMOS LOS APROBADOS
  aprobados=length(lista_notas(lista_notas>=4));
  printf("CANTIDAD DE GENTE QUE APROBÓ EL EXAMEN: %d\n",aprobados);
  printf("PORCENTAJE DE APROBADOS: %s %.2f %% %s \n",RED, aprobados/cantidad_alumnos*100, RESET);
  
endfunction