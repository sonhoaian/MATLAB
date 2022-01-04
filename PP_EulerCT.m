clear, clearvars, clc;
format long;
h = 0.2;
x=0:h:1;
f= @(x, y) (x^2 -y);
y0=1;
%k = BTVN_2_PPT_LT.ppEurle(x, h, y0, f)
k = ppEulerCaiTien(x, h, y0, f)

function [giatri] = ppEulerCaiTien(giatri_x, step, y0, hamso)
    isize = length(giatri_x);
    y = zeros(1,isize);
    y(1) = y0;
    for i = 1:isize -1
        k1 = hamso(giatri_x(i),y(i));
        p = y(i) + step*k1;        
        k2 = hamso(giatri_x(i+1), p);
        y(i+1) = y(i) + step*(k1+k2)/2;
    end
    giatri = y;
end