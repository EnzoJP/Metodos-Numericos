
function Dif_cen1
  % Datos
  Dt=0.003; % incremento de tiempo
  NDt=1000; % cantidad de Dt a realizar
  M=[ 1 0 0; 0 -1 0; 0 0 2]; % Matriz M
  C=[ 4 0 0; 0 -1 0; 0 0 3]; % Matriz C
  K=[ 0 4 1; 4 2 0; 1 0 1]; % Matriz K

  % Valores Iniciales o actuales
  tac=0;
  yac=[1; 2; 1]; % correspondiente a y1
  vac=[1; 4; 0]; % correspondiente a y2
  R(1,1)=5*exp(tac)+8*exp(2*tac)+cos(tac);
  R(2,1)=-8*exp(2*tac)+4*exp(tac);
  R(3,1)=-cos(tac)-3*sin(tac)+exp(tac);

  % Inicialización
  G=inv(M+(Dt/2)*C); % cálculo del término G
  D=G*(2*M-Dt^2*K); % cálculo del término D
  H=G*((Dt/2)*C-M); % cálculo del término H
  d2=inv(M)*(R-K*yac-C*vac); % cálculo de la derivada segunda
  yan=yac-Dt*vac+((Dt^2)/2)*d2; % cálculo de solución anterior
  t(1)=tac; % Almacenamiento para luego graficar
  y(:,1)=yac;

  % Diferencia Central
  for j=2:NDt
      bac=fun_ind(tac,G,Dt); % cálculo de b que depende del tiempo
      ynu=bac + D*yac + H*yan; % Calculo con Dif Central
      tnu=tac+Dt; % actualización del tiempo
      t(j)=tnu; % Almacenamiento para luego graficar
      y(:,j)=ynu; % almacenamiento de la solución para luego graficar
      yan=yac; % actualización de estado anterior
      yac=ynu; % actualización de estado actual
      tac=tnu;
  end

  % Gráfico
  figure(1)
  plot( t, y(1,:),'g', t, y(2,:),'b', t, y(3,:),'r');
  grid on
end

% Subfunción para determinar el término b
function fy=fun_ind(x,G,Dt)
  r(1,1)=5*exp(x)+8*exp(2*x)+cos(x);
  r(2,1)=-8*exp(2*x)+4*exp(x);
  r(3,1)=-cos(x)-3*sin(x)+exp(x);
  fy=Dt^2*G*r;
end

##
##function dif_central
##  % Datos
##  Dt=1/10; % incremento de tiempo
##  NDt=1500; % cantidad de Dt a realizar
##  M=[ 1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] ; % Matriz M
##  C=[ 0 0 0 0; 0 0 0 0; 0 0 0 0 ; 0 0 0 0]; % Matriz C
##  K=[ 2 -1 0 0; -1 2 -1 0 ;0 -1 2 -1; 0 0 -1 2]; % Matriz K
##  b=[10; 5; 5; 5];
##
##  % Valores Iniciales o actuales
##  tac=0;
##  f=[0; 0; 0; 0]; % correspondiente a y1
##  df=[0; 0; 0; 0]; % correspondiente a y2
##  R(1,1)=b(1,1);
##  R(2,1)=b(2,1);
##  R(3,1)=b(3,1);
##  R(4,1)=b(4,1);
##  % Inicialización
##  G=inv(M+(Dt/2)*C); % cálculo del término G
##  D=G*(2*M-Dt^2*K); % cálculo del término D
##  H=G*((Dt/2)*C-M); % cálculo del término H
##  d2=inv(M)*(R-K*f-C*df);% cálculo de la derivada segunda
##  yan=f-Dt*df+((Dt^2)/2)*d2; % cálculo de solución anterior
##  t(1)=tac; % Almacenamiento para luego graficar
##  y(:,1)=f;
##
##  % Diferencia Central
##  for j=2:NDt
##      bac=fun_ind(tac, G, Dt); % cálculo de b que depende del tiempo
##      ynu=bac + D*f + H*yan; % Calculo con Dif Central
##      tnu=tac+Dt; % actualización del tiempo
##      t(j)=tnu; % Almacenamiento para luego graficar
##      y(:,j)=ynu; % almacenamiento de la solución para luego graficar
##      yan=f; % actualización de estado anterior
##      f=ynu; % actualización de estado actual
##      tac=tnu;
##  end
##
##  % Gráfico
##  figure(1)
##  plot( t, y(1,:))#,'g', t, y(2,:),'b', t, y(3,:),'r');
##  grid on
##
##  disp(y(:,51))
##end
##
##% Subfunción para determinar el término g
##function fy=fun_ind(t, G, dt)
##  if (t<50.1)
##    r(1,1)=10*((-1/50.1)*t + 1);
##    r(2,1)=5*((-1/50.1)*t + 1);
##    r(3,1)=5*((-1/50.1)*t + 1);
##    r(4,1)=5*((-1/50.1)*t + 1);
##    fy=dt^2*G*r;
##  else
##    fy=0;
##  end
##end
