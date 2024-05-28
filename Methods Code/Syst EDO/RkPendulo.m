function RK_pendulo
  %condiciones inciales y datos
  y1=0;
  y2=2;
  t0=0;
  dt=0.01;
  t=0:dt:10;
  Ndt=length(t);

  % Inicialización de los vectores de solución
  y=zeros(2,Ndt);
  y(1,1)=y1;
  y(2,1)=y2;
  t(1)=0;

  % Matriz del sistema lineal
  A=[0 1;-9.8/1 0];
  w=1; % Parámetro del método de Runge-Kutta

  for i=1:Ndt-1
      ya=y(:,i);
      K1=dt*(A*ya); %primer paso Rk
      % tg=(t(i)+dt/2)*(2*w)
      yg=ya+K1/(2*w);  % Valor intermedio
      K2=dt*(A*yg); %segundo paso Rk
      y(:,i+1)=ya+(1-w)*K1+w*K2; % Actualización de y
  endfor

  figure (1)
  plot (t, y(1,:), 'r')

  figure (2)
  plot (t, y(2,:), 'r')
endfunction

