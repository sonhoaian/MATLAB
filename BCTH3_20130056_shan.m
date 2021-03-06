%phuong phap lap
clear all, clc;
a = -20;
%x0 tham so x0 dau vao x0 = 0.5, do chinh xac esp = 5*10^(-5)
x0 = 7.2;
esp = 1*10^(-7);

% gx hàm g(x) = x
gx = @(x)((x^2 - 55)/a +x);

% bien gan x(i + 1)
xip1=gx(x0);

% ham kiem tra fx 
fx = @(x) (x^2 - 55);

%dh_gx dao ham g(x)
dh_gx = @(x) (2*x/a + 1);

%viet thuat toan
iloop = 0;
while (abs(xip1 - x0)>= esp)
    iloop = iloop + 1;
    if (fx(xip1) == 0) 
        return;
    elseif (abs(dh_gx(x0)) > 1)
        disp('Khong ton tai nghiem thoa mãn x0');
        return;
    else
        x0 = xip1;
        xip1 = gx(x0);
    end
end
format long;
disp('nghiem x cua phuong trinh la:')
disp(xip1)
disp('so vong lap')
disp (iloop)
format bank;






