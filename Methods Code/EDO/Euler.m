function Euler

  %cond iniciales
  x0=0;
  y0=2;
  %---
  paso=0.1;
  x=x0:paso:1;
  nd=length(x); %cant puntos
  y=zeros(nd,1);
  y(1)=y0;

  yexact(1)=exp(2*x(1))+x(1)+1;

  %---
  %EULER
  for i=1:nd-1
    fxm=2*y(i)-2*x(i)-1; %pendiente (deriv)
    y(i+1)=y(i)+paso*(fxm); %y aproximado
    yexact(i+1)=exp(2*x(i+1))+x(i+1)+1;
  end
  y(nd)
  yexact(nd)

  plot(x,y,'--r',x,yexact)

endfunction
