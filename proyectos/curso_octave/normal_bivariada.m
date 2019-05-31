function pdf = normal_bivariada(x, mu = 0, sigma = 1)
  [d, p] = size (x);
  r = chol (sigma); %descomposicion de cholesky
  pdf = (2*pi)^(-p/2) * exp (-sumsq ((x-mu)/r, 2)/2) / prod (diag (r)); 
  pdf= reshape (pdf, sqrt(size(x,1)),sqrt(size(x,1)));
end
