%he hai phuong trinh vi phan cap 1
%rubgukuta bac 4
clear, clearvars, clc;
format rational;
c = 0.2;
k = 0.3;
m = 1;
step = 10^-2;
t= 0:step:7;
elm = length(t);
f = @(t, x, v) (v);
g = @(t, x, v) (-(c*v+k*x)/m);
v = zeros(1, elm);
x = zeros(1, elm);
v(1) = 0;
x(1) = 1;

for i = 1 : length(x)-1
    %tinh cac gia so  tu k(1-4], m[1-4]
    k1 = step*f(t(i), x(i), v(i));
    m1 = step*g(t(i), x(i), v(i));

    k2 = step*f(t(i) + 0.5*step, x(i) + k1*0.5, v(i) + 0.5*m1);
    m2 = step*g(t(i) + 0.5*step, x(i) + k1*0.5, v(i) + 0.5*m1);

    k3 = step*f(t(i) + 0.5*step, x(i) + k2*0.5, v(i) + 0.5*m2);
    m3 = step*g(t(i) + 0.5*step, x(i) + k2*0.5, v(i) + 0.5*m2);

    k4 = step*f(t(i) + step, x(i) + k3, v(i) + m3);
    m4 = step*g(t(i) + step, x(i) + k3, v(i) + m3);

    x(i + 1) = x(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    v(i + 1) = v(i) + (1/6)*(m1 + 2*m2 + 2*m3 + m4);
end

format default;
%length(t)
for i =1: length(t)
     fprintf("gia tri tai t(%i) = %.2f của x(%i) = %.8f, va v(%i) = %.8f\n" ...
         ,i, t(i), i, x(i), i, v(i));
end


plot(t,x,'r', 'LineWidth', 1.4);
grid on;
hold on;
plot(t, v,'k', 'LineWidth', 1.4);
grid on;
legend("x(t)", "v(t)");
ylabel("value");
xlabel("Time unit (t):s");