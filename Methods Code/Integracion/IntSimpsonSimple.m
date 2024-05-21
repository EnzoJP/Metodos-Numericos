function simpsimple

  %Codigo es igual al compuesto nada mas
  % que como dato solo tenemos 3 puntos

  x=0:(pi/40):(pi/2);
  y=sin(2*x);
  h = pi/40;
  error = h^2;
  N=length(x);
  rparcialP=0;
  rparcialI=0;
  for i=2:(N-1)
    if mod(i,2) == 0
      rparcialP=rparcialP + 4*y(i);
    else
      rparcialI=rparcialI + 2*y(i);
    end
  endfor

  integral1=(h/3)*(y(1)+rparcialP+rparcialI+y(N))


end
