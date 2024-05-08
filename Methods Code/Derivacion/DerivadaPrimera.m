function d1
  clc, clear
  h = 0.5;
  x=[0,0.5,1,1.5,2,2.5,3]
  y=[167,176,201,241,291,347,400]
  for i=1:length(x)
  if i==1
    derv(i)=(1/(2*h))*(-3*y(i)+4*y(i+1)-1*y(i+2));
  elseif i==length(x)
    derv(i)=(1/(2*h))*(3*y(i)-4*y(i-1)+1*y(i-2));
  else
    derv(i)=(1/(2*h))*(y(i+1)-y(i-1));
  endif
  endfor


  disp(derv);
  %plot(x,y);
  plot(x,derv)


end
