function GaussSeidel
    clc
    clear
    %borrar anteriores ejec
    format long g %para que no salga con e-tal
    N=4; %dim
    tol=1e-2; %tolerancia (error deseado)
    A=[50,-25,0,0;-25,50,-25,0;0,-25,50,-25;0,0,-25,50];
    if (esDiagonalDominanteEstricta(A)==false)
      disp('No se puede');
    else
      b=[10;20;20;10];
      x=zeros(N,1);
      nx=zeros(N,1);
      er=1000;
      it=0;
      while (abs(er) > tol)
          it = it + 1;
          aux = nx;
          for i = 1:N
              sum1 = 0;
              sum2 = 0;
              for j = 1:(i-1)
                  sum1 = sum1 + A(i,j) * nx(j);
              end
              for j = (i+1):N
                  sum2 = sum2 + A(i,j) * x(j);
              end
              nx(i) = (b(i) - sum1 - sum2) / A(i,i);
          end
          er = max(abs(nx - x));
          x = aux;
          if it == 100
              break
          end
      end
      disp('El vector es'); disp(nx);
      disp('El error es'); disp(er);
      disp('Las iteraciones son'); disp(it);
      end

end

function esDiagonalDominante = esDiagonalDominanteEstricta(A)
    [filas, columnas] = size(A);
    esDiagonalDominante = true;

    for i = 1:filas
        suma = 0;
        for j = 1:columnas
            if i ~= j
                suma = suma + abs(A(i, j));
            end
        end
        if abs(A(i, i)) < suma
            esDiagonalDominante = false;
            break;
        end
    end
end


##function norma = normaCuadratica(vector, n)
##
##  norma = 0;
##  for i = 1: n
##    norma = norma + (vector(i))^2;
##  endfor
##
##  norma = sqrt(norma);
##
##endfunction
