%% https://www.youtube.com/watch?v=HhcPu6xveY8&list=PLldiDnQu2phuDUwFDC5fSiKM8MiWgk6zu
%Runge Kutta Methods Coded Up

%Initial Value Problem

% exp(x)
% y0 = 1;
% f = @(x,y) y;
% finalvalue = exp(1);
% 
% tan(x)
% y0 = 0;
% f = @(x,y) 1+y^2;
% finalvalue = tan(1.5);
% % % 
y0 = [0;1];
f = @(x,y) [y(2);-y(1)];


% Timesteps
h = 0.01;
T = 2*pi;
t = 0:h:T;

%Euler Method
EulerY = zeros(length(y0),length(t));

EulerY(:,1) = y0;

for i = 2:length(t)
    EulerY(:,i) = EulerY(:,i-1) + h*f(t(i),EulerY(:,i-1));
end

%Midpoint Method
MidPointY = zeros(length(y0),length(t));

MidPointY(:,1) = y0;

for i = 2:length(t)
    MidPointY(:,i) = MidPointY(:,i-1) + h*f(t(i) + h/2,MidPointY(:,i-1) + h/2*f(t(i),MidPointY(:,i-1)));
end

%RK4
RKY = zeros(length(y0),length(t));
RKY(:,1) = y0;
for i = 2:length(t)
    k1 = h*f(t(i-1),RKY(:,i-1));
    k2 = h*f(t(i-1) + h/2, RKY(:,i-1) + 1/2*k1);
    k3 = h*f(t(i-1) + h/2, RKY(:,i-1) + 1/2*k2);
    k4 = h*f(t(i),RKY(:,i-1) + k3);
    RKY(:,i) = RKY(:,i-1) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
end


if(length(EulerY(:,1)) == 1)
    plot(t,EulerY(1,:),'LineWidth',3);
    hold on

    plot(t,MidPointY(1,:),'LineWidth',3);
    hold on 
    plot(t,RKY(1,:),'LineWidth',3);
end

if(length(EulerY(:,1)) > 1)
plot(EulerY(1,:),EulerY(2,:),'LineWidth',3);
hold on

plot(MidPointY(1,:),MidPointY(2,:),'LineWidth',3);
hold on 
plot(RKY(1,:),RKY(2,:),'LineWidth',3);
end

legend('Euler','MidPoint','RK4');
hold off
