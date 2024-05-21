function interpolacion_newton
  clc; clear;
  x = [3, 7, 9];
  y = [5, -1, 2];

  a1 = (y(2)-y(1))/(x(2)-x(1)) # a1
  a = [y(1), a1];

  # solo funciona si me dan 3 puntos
  for i=3:length(x)
    t = (y(i)-y(i-1))/(x(i)-x(i-1));
    a(i) = (t-a(i-1))/(x(i)-x(1))
  endfor
endfunction
