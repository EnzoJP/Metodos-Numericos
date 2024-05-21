function d1
  clc, clear
  %datos
  h = 0.5; %paso
  x=[0,0.5,1,1.5,2,2.5,3];
  y=[167,176,201,241,291,347,400];

  %calculo de la deriv
  for i=1:length(x)
  if i==1
    derv(i)=(1/(2*h))*(-3*y(i)+4*y(i+1)-1*y(i+2)); %adelante
  elseif i==length(x)
    derv(i)=(1/(2*h))*(3*y(i)-4*y(i-1)+1*y(i-2)); %atras
  else
    derv(i)=(1/(2*h))*(y(i+1)-y(i-1)); %centales
  endif
  endfor


  disp(derv);
  %plot(x,y);
  plot(x,derv)


end
