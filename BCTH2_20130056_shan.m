clear;

%x0 tham so x0 dau vao x0 = 0.5, do chinh xac esp = 5*10^(-5)
x0 = 0.5;
esp = 5*10^(-5);

% gx hàm g(x) = x
gx = @(x)(exp(-x));

% bien gan x(i + 1)
xip1=gx(x0);

% ham kiem tra fx 
fx = @(x) (exp(-x) - x);

%dh_gx dao ham g(x)
dh_gx = @(x) (-exp(x));

%viet thuat toan
iloop = 0;
while (abs(xip1 - x0)>= esp)
    iloop = iloop + 1;
    if (fx(xip1) == 0) 
        exit;
    elseif (abs(dh_gx(x0)) > 1)
        disp('Khong ton tai nghiem thoa mãn x0 =');
        exit;
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






