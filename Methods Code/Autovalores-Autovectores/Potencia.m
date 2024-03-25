function Potencia

  clc
  clear
  format long g

  x=[2;2];
  A=[-10 4;-4 0];
  tol=0.1;
  err=1000;
  lamda=0;
  cond=false;
##  if (A*x==lamda*x)
##      cond=true;
##  end
  while (cond==false)
    disp('f')
    xn=A*x;
    lamda=(xn/x);
    if (A*xn==lamda*xn)
      cond=true;
    end
  end
end




function norma = normaCuadratica(vector, n)

  norma = 0;
  for i = 1: n
    norma = norma + (vector(i))^2;
  endfor

  norma = sqrt(norma);

endfunction

function norma = normainfinito(vector, n)
  bigger = abs(vector(1));
  for i = 1 : n
    if bigger < abs(vector(i))
      bigger = abs(vector(i));
    endif
  endfor
  norma = bigger;
  return
endfunction
