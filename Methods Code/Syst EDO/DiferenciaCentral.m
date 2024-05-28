
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


##function DFCSistema
##  M=[1,0,0;0,-1,0;0,0,2];
##  C=[4,0,0;0,-1,0;0,0,3];
##  K=[0,4,1;4,2,0;1,0,1];
##  dt=0.01;
##  t1=0;
##  tfinal=3;
##
##  x=t1:dt:tfinal;
##
##  GenCero=[1;2;1];
##  GPrimaEnT0=[1;4;0];
##
##  R(1,1)=5*(e^0)+8*(e^(2*0))+cos(0);
##  R(2,1)=(-8*(e^2*0))+4*(e^0);
##  R(3.1)=-cos(0)-3*sin(0)+(e^0);
##
##  G=inv(M+(dt/2)*C);
##  D=G*(2*M - (dt^2)*K);
##  H=G*((dt/2)*C-M);
##  b=((dt)^2)*G*R;
##
##  GPrima2= (R-(C.*GPrimaEnT0) - (K.*GenCero))*inv(M);
##
##  PAnterior=GenCero-dt*GPrimaEnT0+(((dt)^2)/2)*GPrima2;
##
##  for i=1:length(x)
##    R(1,i)=5*(e^x(i))+8*(e^2*x(i))+cos(x(i));
##    R(2,i)=(-8*(e^2*x(i)))+4*(e^x(i));
##    R(3,i)=-cos(x(i))-3*sin(x(i))+(e^x(i));
##
##    PNuevo=b(x(i))+D*GenCero+H*PAnterior
##  endfor
##
##
##endfunction
