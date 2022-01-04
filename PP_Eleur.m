clear, clearvars, clc;
format short;
h = 0.2;
x=0:h:1;
f= @(x, y) (x^2 -y);
error = h^3; 
y0=1;
y = ppEuler(x, h, y0, f);
k = ppEulerCaiTien(x, h, y0, f, error);

for i = 1: length(x)
  fprintf("gia tri can tim tai x(%i) = %2.4f  bang pp Euler la y(%.1f) = %2.10f \n", i, x(i), x(i), y(i));

  fprintf("gia tri can tim tai x(%i) = %2.4f bang pp Euler cai tien la y(%.1f) = %2.10f \n", i, x(i), x(i), k(i));
end
z = -exp(-x) + x.^2 - 2*x + 2;
disp(z);

format default;

function [giatri] = ppEuler(giatri_x, step, y0, hamso)
            isize = length(giatri_x);
            y = zeros(1,isize);
            y(1) = y0;
            for i = 1:isize -1
              y(i+1) = y(i) + step* hamso(giatri_x(i), y(i));
              %T(i+1)=A+i*(i+1)
            end
            giatri = y;
end

function [giatri] = ppEulerCaiTien(giatri_x, step, y0, hamso, error)
    isize = length(giatri_x);
    y = zeros(1,isize);
    y(1) = y0;
    for i = 1:isize - 1
        k1 = hamso(giatri_x(i),y(i));
        p = y(i) + step*k1;        
        k2 = hamso(giatri_x(i+1), p);
        y(i+1) = y(i) + step*(k1+k2)/2;
        %xet dieu kien sai so cua y(i+1)
        while (abs(y(i+1) - p) > error)
            p = y(i+1);
            k2 = hamso(giatri_x(i+1), p);
            y(i+1) = y(i) + step*(k1+k2)/2;
        end
    end
    giatri = y;
end
