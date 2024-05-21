function rungekutta
  clc,clear
  omega=1;
  paso=0.1;
  x=0:paso:10;

  y(1)=4;
  x(1)=0;
  n=length(x);

  for i=1:(n-1)
    k1=paso*(0.5*x(i)-0.5*y(i));

    xg=x(i)+(paso/(2*omega));
    yg=y(i)+(k1/(2*omega));

    k2=paso*(0.5*xg-0.5*yg);

    y(i+1)= y(i)+(1-omega)*k1+omega*k2;

  endfor

  plot(x,y,x,6*e.^(-x/2)-2+x)

endfunction
