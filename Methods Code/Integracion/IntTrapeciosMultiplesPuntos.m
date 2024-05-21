function intTrapeciosMultiplesPuntos
  %datos
  x=[0,0.1,0.2,0.3,0.4];
  y=[1,7,4,3,5];
  dx=x(2)-x(1); %paso
  n=length(x); %cant punt

  %calculo de la int1
  c(1) = y(1)/2; %primer interv
  c(n)= y(n)/2;  %segundo interv
  int=0; %contador
  for i=2:n-1
    int=int+y(i);
  end
  Integral=dx*(c(1)+int+c(n))
end
