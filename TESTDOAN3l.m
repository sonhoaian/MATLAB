clear, clearvars, clc;

Vo = 50;
g = 9.8;
alpha = 30;
Vx = @(v, a) v*cos(a);
Vy = @(v, a) v*sin(a);
t=linspace(0,(2.0*Vo*sin(alpha*pi/180)/g));

%Dieu kien co he so can c = 0.1
c = 0.1;

[time1, Fx] = ode45(@(t,x)([x(2); -c*x(2)]),t, [0 Vx(Vo, alpha*pi/180)]);
X = Fx(:,1);

[time1, Fy] = ode45(@(t,y) ([y(2);- g - c*y(2)]), t, [0 Vy(Vo, alpha*pi/180)]);
Y = Fy(:,1);

%Dieu kien he so can c = 0
c = 0;

%recall function - due to ODE45 bug, which was reported on MATLAB forum on
% 12/6/2018, in MATLAB and Octave. So we call a function dirrectly inside 
% ode45 fucntion instead using inline function f = @(x, y) (....) 

[time1, Fx2] = ode45(@(t,x)([x(2); -c*x(2)]),t, [0 Vx(Vo, alpha*pi/180)]);
X2 = Fx2(:,1);
[time1, Fy2] = ode45(@(t,y) ([y(2);- g - c*y(2)]), t, [0 Vy(Vo, alpha*pi/180)]);
Y2 = Fy2(:,1);
%Ve Do thi
figure; 
axis([0 max(max(X), max(X2))+10 0 max(max(Y), max(Y2))+10]);
grid on;
hold on;
for i=1:length(t)
  plot(X(i),Y(i),'*r', X2(i),Y2(i),'*b', 'MarkerSize', 3);
  pause(0.05);
  hold on;
end
legend('c = 0.1','c = 0');

