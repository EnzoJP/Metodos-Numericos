function JacobiAlter
  clc
  clear
  %borrar anteriores ejec
  format long g %para que no salga con e-tal
  N=4; %dim
  tol=1e-2; %tolerancia (error deaseado)
  A=[50,-25,0,0;-25,50,-25,0;0,-25,50,-25;0,0,-25,50];
  if (esDiagonalDominanteEstricta(A)==false)
      disp('No se puede');
  else
    b=[10;20;20;10];
    D=zeros(N);
    B=zeros(N);
    x=zeros(N,1);
    nx=[0;0;0;0];
    er=1000;
    it=0;
     for i=1:N
       for j=1:N
         if (j==i)
           D(i,j)=A(i,j);
         else
           B(i,j)=A(i,j);
         end
       end
     end
    T=-inv(D)*B;
    c=inv(D)*b;
    while (abs(er)>tol)
      nx=T*x+c;
      it=it+1;
      er=max(abs(nx-x));
      x=nx;
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

