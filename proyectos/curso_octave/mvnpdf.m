function pdf = mvnpdf (x, mu = 0, sigma = 1)
  ## Check input
  if (!ismatrix (x)) %se fija que sea matriz
    error ("mvnpdf: first input must be a matrix");
  endif
  
  if (!isvector (mu) && !isscalar (mu)) %se fija que sean vectores o escalares
    error ("mvnpdf: second input must be a real scalar or vector");
  endif
  
  if (!ismatrix (sigma) || !issquare (sigma)) %se fija que sea matriz y sea cuadrada
    error ("mvnpdf: third input must be a square matrix");
  endif
  
  [ps, ps] = size (sigma); %dimension de la raiz de la varianza
  [d, p] = size (x);
  
  if (p != ps)
    error ("mvnpdf: dimensions of data and covariance matrix does not match");
  endif
  
  if (numel (mu) != p && numel (mu) != 1) %cantidad de elementos de mu (esperanza)
    error ("mvnpdf: dimensions of data does not match dimensions of mean value");
  endif

  mu = mu (:).';
  if (all (size (mu) == [1, p])) %si todos los elementos de algo cumplen una condicion
    mu = repmat (mu, [d, 1]); %diagonaliza en bloques, no importa esto
  endif
  
  if (nargin < 3) %cantidad de parametros recibidos
    pdf = (2*pi)^(-p/2) * exp (-sumsq (x-mu, 2)/2); %la funcion en caso de ser otra cantidad de parametros
  else
    r = chol (sigma); %descomposicion de cholesky
    pdf = (2*pi)^(-p/2) * exp (-sumsq ((x-mu)/r, 2)/2) / prod (diag (r)); %por fin, la funcion
  endif
endfunction
