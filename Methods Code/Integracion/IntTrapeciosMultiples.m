function tpmul
  %datos
  h = pi/40;
  x=0:h:(pi/2);
  y(:,1)=sin(2*x);
  %error = h^2;
  N=length(x);

  %calculo integral
  rparcial=0;
  for i=2:(N-1)
    rparcial=rparcial + 2*y(i);
  endfor

  integral=(h/2)*(y(1)+rparcial+y(N))


end
