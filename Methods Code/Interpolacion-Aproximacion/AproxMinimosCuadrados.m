function aproximacion
  clc,clear
  %datos
  x = [0; 1; 1; 3; 4; 5; 6];
  y = [4; 7; 9; 10; 9; 12; 15];

  fi = hacerfi(x);
  fiT = transpose(fi);

  a = (fiT * fi) \ (fiT * y) %vector coeficientes
  funcion = a(1) * 1 + a(2) * x.+ a(3)*x.^2;
  plot(x,y,'o' , x,funcion)

endfunction


function fi = hacerfi(x)
  for i = 1: length(x)
    fi(i, 1) = 1;
    fi(i, 2) = x(i);
    fi(i, 3) = x(i)^2; %ya que es cuadratica
  endfor

endfunction

##function MinCuadrados
##  x = [-0.75;-0.25;0.25;0.75;1.25]
##  y = [548.25;437.75;437.75;548.25;799.00]
##  for i = 1:5
##    pT(1,i) = e^x(i);
##    pT(2,i) = e^(-x(i));
##  endfor
##  pT
##  p = transpose(pT)
##
##  A = pT * p
##  B = pT * y
##
##  c = A\B
##endfunction
