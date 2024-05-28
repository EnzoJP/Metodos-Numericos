function DiferenciaPendulo
  clc
  clear
  %condiciones iniciales y datos
  tita0=0;
  dtita=2;
  g=9.8;
  L=1;
  t0=0;
  dt=0.01;
  t=0:dt:10;
  titac=tita0;
  tac=0;
  titant=titac-dt*dtita+0.5*dt^2*(-g/L*titac); %anterior tita en t-dt
  t(1)=tac;
  tita(1,1)=titac;
  for i=2:length(t)
    titaNuev=(2-g*dt^2/L)*titac-titant %nueva tita en t+dt
    t(i)=tac+dt;
    tita(1,i)=titaNuev;
    %act variables
    titant=titac;
    titac=titaNuev;
    tac=t(i);
  end

  plot(t,tita(1,:));

endfunction
