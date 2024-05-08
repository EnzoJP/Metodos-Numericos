function tpmul
  x=0:(pi/40):(pi/2);
  y=sin(2*x);
  h = pi/40;
  error = h^2;
  N=length(x);
  rparcial=0;
  for i=2:(N-1)
    rparcial=rparcial + 2*y(i);
  endfor

  integral1=(h/2)*(y(1)+rparcial+y(N))


end
