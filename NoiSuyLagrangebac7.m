%cai dat ban dau
clear all;
format long;
syms x;

%z1 = [4.9 9.1 13.7 18.3 ];
%T1 = [22.8 20.6 13.9 11.7];

z1= [0 2.3 4.9 9.1 13.7 18.3 22.9 27.2];
T1= [22.8 22.8 22.8 20.6 13.9 11.7 11.1 11.1];

%tham s? c?n t�nh
%X_cal = 12;

if ((length(z1)*length(T1) < 4) || (length (z1) ~= length(T1)))
  fprintf("tham so dau vao khong hop le\n");
  return ;
else
  fprintf("bai tap 1\n");
  result =  hamLarange(z1, T1, x);

  zz = linspace(0,27.2);%moc noi suy
  a = zeros(1,length(zz));
  l =1;
  for i=1:100      
      a(1,i)=hamLarange(z1, T1, zz(i));
  end
  subplot(1,3,1);
  plot(T1,z1, 'o',a,zz);
  title('T(z)'),legend('data','T')
  set(gca,'YDir','reverse'),grid;   
   s = @(x) subs(diff(result),x);
   iCount = 1;
   df= zeros(1,length(s(z1)));
   for i = s(z1)
       df(iCount) = i;
       iCount = iCount+1;
       if iCount > length(s(z1)) iCount = 1; end
   end
   subplot(1,3,2);
  plot(df,z1); grid
  title('dT/dz');
  set(gca,'YDir','reverse'),grid;
  s2 = @(x) subs(diff(result,2),x);
  df2= zeros(1,length(s2(z1)));
  for i = s2(z1)
      df2(iCount) = i;
      iCount = iCount+1;
      if iCount > length(s2(z1)) i = 1; end
  end
  subplot(1,3,3);
  plot(df2,z1); grid
  title('dT^2/d^2z');
  set(gca,'YDir','reverse'),grid; 
  diff(result,2)
  disp('cac nghiem tim duoc')
  for i= (double(solve((diff(result,2) == 0),x)))
      disp(i);      
  end
end
hamLarange(z1,T1,11.611996811790462)
format bank;

%khai bao function
%su dung phuong phap Larange tinh tham so y theo tham so cho truoc x
function [Fraction_result] = hamLarange(X, Y, cal_Point)
  %b?c ?a th?c
  iLevel = length(X);
  
  %bien ph�n th?c
  Fraction = 0;

  %vong lap 1 cho bi?n x_i ? m?u 
  for iDenominator=1:iLevel
    Denominator = 1;
    Numerator = Y(iDenominator);

    % vong lap 2 cho cac bien x_j ? t? v� m?u
    for iNumerator= 1:iLevel
      if iNumerator ~= iDenominator
        Numerator = Numerator*(cal_Point - X(iNumerator));
        Denominator = Denominator*(X(iDenominator)-X(iNumerator));
      end
    end    

    %cong don ket qua
    Fraction = Fraction + Numerator/Denominator;
  end

  %tra ket qua ra ben ngoai
  Fraction_result = Fraction;
end

%return cai dat he thong



