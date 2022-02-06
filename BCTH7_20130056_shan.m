%he hai phuong trinh vi phan cap 1
%rubgukuta bac 4
clear, clearvars, clc;
format rational;
step = 0.1;
t= 0:step:0.5;
elm = length(t);
f = @(t, x, y) (-x*0.5);
g = @(t, x, y) (4 - 0.3*y -0.1*x);
y = zeros(1, elm);
x = zeros(1, elm);
y(1) = 6;
x(1) = 4;

for i = 1 : length(x) -1
    %tinh cac gia so  tu k(1-4], m[1-4]
    k1 = step*f(t(i), x(i), y(i));
    m1 = step*g(t(i), x(i), y(i));

    k2 = step*f(t(i) + 0.5*step, x(i) + k1*0.5, y(i) + 0.5*m1);
    m2 = step*g(t(i) + 0.5*step, x(i) + k1*0.5, y(i) + 0.5*m1);

    k3 = step*f(t(i) + 0.5*step, x(i) + k2*0.5, y(i) + 0.5*m2);
    m3 = step*g(t(i) + 0.5*step, x(i) + k2*0.5, y(i) + 0.5*m2);

    k4 = step*f(t(i) + step, x(i) + k3, y(i) + m3);
    m4 = step*g(t(i) + step, x(i) + k3, y(i) + m3);

    x(i + 1) = x(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    y(i + 1) = y(i) + (1/6)*(m1 + 2*m2 + 2*m3 + m4);
end

format default;
for i =1: length(t)
    fprintf("gia tri tai t(%i) = %.1f của x(%i) = %.8f, va y(%i) = %.8f\n",i, t(i), i, x(i), i, y(i));
end