function PotenciaInversa

  clear
  clc
  format long g

  A=[-10 4;-4 0];
  x0=[-3;2];
  tol=0.0001;

  x=x0;
  xn=(inv(A))*x;

  #[z,y]=eig(A);

  norma=norm(x,inf);
  x=x./norma;
  norma=norm(xn,inf);
  xn=xn./norma;

  it=1;
  lamda=zeros(1:2);

  while abs(((xn')*xn)/((xn')*x)) >= 1+ tol && it<30
    it++;
    x=xn;
    xn=inv(A)*x;
    lamda=xn./x;
    norma=norm(x,inf);
    x=x./norma;
    norma=norm(xn,inf);
    xn=xn./norma;


  end
  autovalor=1./lamda(1);

  display('el autovector es'), disp(xn); %mantiene la misma direccion
  display('el autovalor es'), disp(autovalor); %el mas chico
  disp('iter'),disp(it);



end


##function norma = normaInfinito(vector,n)
##
##
## norma=vector
## for i=1:N
## norma(i)=norma(i)/(max(abs(vector)))
## endfor
##
##end
