function Jacobi
  clc
  clear
  %borrar anteriores ejec

  format long g %para que no salga con e-tal
  N=3; %dim
  tol=1e-2; %tolerancia (error deaseado)
  A=[-3 1 -2; 4 -5 0; 1 -3 6];
  if (esDiagonalDominanteEstricta(A)==false)
      disp('No se puede');
  else
    b=[-2; 5; 6];
    x=zeros(N,1);
    er=1000;
    it=0;
    while (abs(er)>tol)
    it++;
      for i=1:N
        sum=0;
        for j=1:N
          if (j~=i)
            sum= sum + A(i,j) * x(j);
          end
        end
      xn(i)=(b(i)-sum)/A(i,i);
      e(i)=(abs(xn(i)-x(i)));
      end
      x=xn;
      er=max(e);
    end
  end
  disp('EL vector es'),x
  disp('El error es'), er
  disp('Las iteraciones son'),it
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

