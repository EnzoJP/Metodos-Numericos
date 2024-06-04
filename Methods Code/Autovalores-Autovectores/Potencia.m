function potencia  %metodo normalizado

  clear
  clc
  format long g

  A=[-10 4;-4 0];
  x0=[-3;2];
  tol=0.0001;
  %calculos iniciales
  x=x0;
  xn=A*x;

  #[z,y]=eig(A) %verificación

  norma=norm(x,inf);
  x=x./norma;
  norma=norm(xn,inf);
  xn=xn./norma;

  it=1;
  lamda=zeros(1:2);

  while abs(((xn')*xn)/((xn')*x)) >= 1+ tol && it<30 %cond de detencion
    x=xn;
    xn=A*x;
    lamda=xn./x;
    norma=norm(x,inf);
    x=x./norma;
    norma=norm(xn,inf);
    xn=xn./norma;
    it=it+1;
  end

  display('el autovector es'), disp(xn);
  display('el autovalor es'), disp(lamda(1)); %autovalor dominante (+alto)
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
