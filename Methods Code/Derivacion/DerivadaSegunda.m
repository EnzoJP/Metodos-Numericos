function dervSegunda
  clc, clear
  %datos
  h = 0.1;
  x=0:h:1;
  y=cos(pi*x);


  for i=1:length(x)
    if i==1
      derv(i)=(1/h^2)*(2*y(i)-5*y(i+1)+4*y(i+2)-1*y(i+3)); %del
    elseif i==length(x)
      derv(i)=(1/h^2)*(2*y(i)-5*y(i-1)+4*y(i-2)-1*y(i-3)); %atras
    else
      derv(i)=(1/h^2)*(y(i+1)-2*y(i)+y(i-1)); %centrales
    endif
  endfor


  disp(derv);
  %plot(x,y);
  plot(x,derv)


end
