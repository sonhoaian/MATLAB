%%pp chia dôi
clear all

% so ben trai
xl = -2;

%so ben phai
xr = 4;

%sai so
ss = 5*10^(-6);

loop = 0;

%khai bao ham f
f = @(x)(x^3 - x^2 + x - 5);

while (abs(xl - xr) >= ss)
  loop = loop + 1;
  
  %tim so trung vi
  xm = (xl + xr)/2.;
  
  %kiem tra die kien trung vi
  if (f(xm) == 0)
    exit();
  end
  
  % neu f(xm) * f(xr) < 0 thi gan gia tri moi cho xl, nguoc lai gan cho xr
  if (f(xm)*f(xr) < 0) 
    xl = xm;
  else
    xr = xm;
  end
end
format long;
disp('nghiem va sai so pp la:');
disp([xr,abs(xl - xr)]);
disp('so vong lap: ');
disp(loop);
format short;