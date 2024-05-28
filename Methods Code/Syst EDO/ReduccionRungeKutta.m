function RK_sistema
  % Datos
  dt=0.003; % incremento de tiempo
  Ndt=1000; % cantidad de Dt a realizar
  M=[ 1 0 0; 0 -1 0; 0 0 2]; % Matriz M
  C=[ 4 0 0; 0 -1 0; 0 0 3]; % Matriz C
  K=[ 0 4 1; 4 2 0; 1 0 1]; % Matriz K

  % Valores Iniciales o actuales
  tac=0;
  yac=[1; 2; 1]; % correspondiente a y1
  vac=[1; 4; 0]; % correspondiente a y2
  A=zeros(3,3); % Matriz de 3x3 con todos ceros
  B=eye(3); % Matriz identidad de 3x3
  P=-inv(M)*K; % Matriz de 3x3
  Q=-inv(M)*C; % Matriz de 3x3
  T=[A,B,P,Q]; % Matriz formada por las matrices A, B, P y Q

  R1(1,1)=5*exp(tac)+8*exp(2*tac)+cos(tac); % primera componente del Término independiente
  R1(2,1)=-8*exp(2*tac)+4*exp(tac); % segunda componente del Término independiente
  R1(3,1)=-cos(tac)-3*sin(tac)+exp(tac); % tercera componente del Término independiente
  R2=inv(M)*R1;
  R=[0;0;0;R2]; % Armado del Término independiente
  t(1)=tac; % tiempo inicial
  y(:,1)=[yac;vac]; % asigna a todas las filas de la primer columna de la matriz solución la condición inicial
  w=0.5; % Método de Euler Mejorado

  for i=1:Ndt-1
      ya=y(:,i); % solución actual
      k1=dt*(T*ya+R); % obtenemos el vector k1
      tg=t(i)+dt/(2*w); % punto nuevo para el cálculo de la solución intermedia de y y t(i+1)
      yg=ya+dt/(2*w); % punto nuevo para el cálculo de la solución intermedia de y y t(i+1)
      ya=tg*t(i)+dt/(2*w); % solución intermedia de y
      R1(1,i+1)=5*exp(tg)+8*exp(2*tg)+cos(tg); % actualización del Término independiente para tg
      R1(2,i+1)=-8*exp(2*tg)+4*exp(tg); % actualización del Término independiente para tg
      R1(3,i+1)=-cos(tg)-3*sin(tg)+exp(tg); % actualización del Término independiente para tg
      R2=inv(M)*R1(:,i+1);
      R=[0;0;0;R2]; % Armado del Término independiente para el tiempo tg
      k2=dt*(T*ya+R); % obtenemos el vector k2
      y(:,i+1)=ya+(1-w)*k1+w*k2; % Nueva solución para y
      t(i+1)=t(i)+dt; % actualización del tiempo
  end

  % Gráficos
  plot(t, y(1,:),'r', t, y(2,:),'b', t, y(3,:),'g');
end

