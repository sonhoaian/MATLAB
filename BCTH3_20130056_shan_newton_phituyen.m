%phuong phap Newton

clear all, clc;

x0 = 7.2;
esp = 0.00005;

f = @(x)(x^2 - 55);
dh_f = @(x)(2*x);
dif_dh_f = @(x)(2);

% if(abs(f(x0)*dif_dh_f(x0))/ (dh_f(x0)^2)>1) 
%     return; 
% end

iloop = 0;

while(abs(f(x0)) > esp)
    if(abs(f(x0)*dif_dh_f(x0))/ (dh_f(x0)^2)>1) 
        break;
    end
    x0 = x0 - f(x0)/dh_f(x0);
    iloop = iloop +1;
end

format long;
disp('nghiem x cua phuong trinh la:')
disp(x0)
disp('so vong lap')
disp (iloop)
format bank;