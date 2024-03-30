function raicesMultiples
  %regulaFalsi mod
  clc
  clear
  %intervalo [0;10]
  stop = 0;
  iter = 0;
  format long;
  x = 0:0.1:10;
  %extremos de los intervalos donde se buscarán las raíces
  a1 = [0,2,3,5,7,8];
  b1 = [1,3,4,6,8,9];
for i = 1 : 6
  a = a1(i);
  b = b1(i);
  while stop == 0
    fa = f(a);
    fb = f(b);
    m = (fa - fb) / (a - b);
    r1 = a - (fa / m);
    iter = iter + 1;
    fR1 = f(r1);

  if abs(fR1) < 10^(-6); %precision
    stop = 1;
  endif
  if iter > 1000;
    stop = 1;
  endif
  % Actualiza los extremos del intervalo
  if stop == 0;
    if fa * fR1 < 0;
      a = r1;
    else
      if fb * fR1 < 0;
      b = r1;
      endif
    endif
   endif
 endwhile
 %guarda raiz encontrada
 raices(i) = r1;
 stop = 0;

endfor

disp("Las raices son: ")
raices

for i = 1: length(x)
  y(i) = f(x(i));
endfor

plot(x, y, 'b', raices,0, 'r', 'MarkerSize', 20);

endfunction

function y=f(x)
  y=10*exp(x/2)*cos(2*x);
endfunction

