function RK_sistema
  clc
  format long g
  M=[0.25^2 0 0; 0 0.5^2 0; 0 0 0.75^2];
  k=[2 -1 0; -1 2 -1; 0 -1 2];
  c=(12/(0.25^2));    %constante
  A=zeros(3,3);       % Matriz de 3x3 con todos ceros
  B=eye(3);           % Matriz identidad de 3x3
  P=-inv(M)*c*k;         % Matriz de 3x3
  K=[A,B;P,A]         % Matriz formada por matriz A, B, P y A
  y0=[sin(pi*0.25); sin(pi*0.5); sin(pi*0.75);3;3;3]  % Vector solución inicial
  dt=0.01              % paso de tiempo

  t=0:dt:1;
  Ndt=length(t)         % cantidad de puntos
  y(:,1)=y0;          % asigna a todas las filas de la primer columna de la matriz solución la condición inicial
  w=0.5;              % Método de Euler Mejorado

  for i=1:Ndt-1
    ya=y(:,i);          % solución actual
    k1=dt*K*ya;         % obtenemos el vector k1
    tg=t(i)+dt/(2*w);   % punto nuevo para t entre t(i) y t(i+1)
    yg=ya+k1/(2*w);     % solución intermedia de y
    k2=dt*K*yg;         % obtenemos el vector k2
    y(:,i+1)=ya+(1-w)*k1+w*k2; % Nueva solución para y
  end
  % Graficos
  plot(t, y(1,:),'r',t, y(2,:),'b',t,y(3,:),'g')
endfunction

