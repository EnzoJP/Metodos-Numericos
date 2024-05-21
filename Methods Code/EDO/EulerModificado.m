
function Eulermod
  y0=4;
  % Valores Iniciales
  t0=0;
  Dt=0.01;
  % incremento de tiempo
  NDt=1000;
  % cantidad de Dt a realizar
  % Dimensionamiento
  t=zeros(NDt,1);
  % vector para tiempo
  y=zeros(NDt,1);
  % vector para y(t)
  % Inicialización
  t(1)=t0;
  y(1)=y0; w=1;
  % EULER
  for j=1:NDt-1
    k1=Dt*(-(1/2)*y(j) + (1/2)*t(j));
    yg = y(j) + k1/(2*w);
    tg = t(j) + Dt/(2*w);
    k2=Dt*(-(1/2)*yg + (1/2)*tg);
    y(j+1) = y(j)+ (1-w)*k1+w*k2;
    t(j+1) = t(j)+Dt;
  end
  % Graficación
  figure(1)
  disp(y)
  plot(t,y(:,1),'b');
end
