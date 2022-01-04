%rubgukuta bac 4
clear, clearvars, clc;
format rational;
step = 0.2;
x= 0:step:1;
y = [1, length(x)];
f = @(x, y) ((x^2 - y));
y(1) = 1;

for i = 1 : length(x) -1
    k1 = step*f(x(i), y(i));
    k2 = step*f(x(i) + 0.5*step, y(i) + 0.5*k1);
    k3 = step*f(x(i) + 0.5*step, y(i) + 0.5*k2);
    k4 = step*f(x(i) + step, y(i) + k3);
    y(i + 1) = y(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

for i = 1: length(x)
    fprintf("gia tri cua y(%1.2f) là %1.6f \n",x(i), y(i));
end
format bank;