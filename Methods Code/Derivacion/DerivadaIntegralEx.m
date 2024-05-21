function Ejercicio_Integral_Derivada
  #DERIVADA
  h=0.5;
  x=0:h:3;
  y=[167 176 201 241 291 347 400];

  for i=1:length(x)
    if i==1
      d2=(1/(2*h))*(-3*y(i) + 4*y(i+1) - 1*y(i+2));
      derivada(i)=d2;
    elseif i==length(x)
      d2=(1/(2*h))*(3*y(i) - 4*y(i-1) + 1*y(i-2));
      derivada(i)=d2;
    else
      d2=(1/(2*h))*(y(i+1)-y(i-1));
      derivada(i)=d2;
    endif
  endfor
  disp(derivada)
  #plot(x,result);

  ##########################################

  #ejercicio resolver la integral de la funcion (2*pi*x(i)*(derivada(i)^2)
  funcion=zeros(1,length(x)); #funcion seria nuestro nuevo "y" el que usaremos para hacer la integral
  for i=1:length(x)
    funcion(i)=2*pi*x(i)*(derivada(i)^2);
  endfor

  ##########################################
  #REALIZO LA INTEGRAL EN ESTA SECCION
  n=length(funcion);
  suma=0;
  for i=2:(n-1)
    suma=suma+2*funcion(i);
  endfor
  f=h/2*(funcion(1)+suma+funcion(n));

  disp(f) #solucion final
endfunction
