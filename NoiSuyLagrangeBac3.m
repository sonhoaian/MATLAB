%cai dat ban dau
clear all;
format long;
%pkg load symbolic
x = sym('x');

z1= [0 2.3 4.9 9.1 13.7 18.3 22.9 27.2];
T1= [22.8 22.8 22.8 20.6 13.9 11.7 11.1 11.1];

%tham s? c?n tính
%X_cal = 12;

if ((length(z1)*length(T1) < 4) || (length (z1) ~= length(T1)))
  fprintf("tham so dau vao khong hop le\n");
  return ;
else
  fprintf("bai tap 1\n");
  h = 3;
  for iSubset = 1:1:5
      result =  hamLarange(z1(iSubset:iSubset + h), T1(iSubset:iSubset + h), x);
      zz = linspace(z1(iSubset),z1(iSubset + h));%moc noi suy
      a = zeros(1, length(z1(iSubset:iSubset + h)));
      for i=1:100      
          a(1,i)=hamLarange(z1(iSubset:iSubset + h), T1(iSubset:iSubset + h), zz(i));
      end
      subplot(1,3,1);
      plot(T1,z1, 'o',a,zz);
      hold on;
      grid on;
      title('T(z)'),legend('data')
      set(gca,'YDir','reverse'); 
      %-----------------
      s = @(x) subs(diff(result),x);
      iCount = 1;
      df= zeros(1,length(s(z1(iSubset:iSubset + h))));
      for i = s(z1(iSubset:iSubset + h))
         df(iCount) = i;
         iCount = iCount+1;
      end
      iCount =1;
      subplot(1,3,2);
      plot(df,z1(iSubset:iSubset + h)); 
      hold on;
      grid on;
      title('dT/dz');
      set(gca,'YDir','reverse'),grid;
      s2 = @(x) subs(diff(result,2),x);
      df2= zeros(1,length(s2(z1(iSubset:iSubset + h))));
      for i = s2(z1(iSubset:iSubset + h))
        df2(iCount) = i;
        iCount = iCount+1;
      end
      subplot(1,3,3);
      plot(df2,z1(iSubset:iSubset + h)); 
      hold on;
      grid on;
      title('d^2T/dz^2');
      set(gca,'YDir','reverse')
  end

  disp("Do sau can tim la")
  zResult = solve((diff(hamLarange(z1(3:6), T1(3:6),x),2) == 0));
  disp(double(zResult));
  disp("Nhiet do can tim o do sau la")  
  disp(double(hamLarange(z1(3:6), T1(3:6),zResult)))

end
format bank;

%khai bao function
%su dung phuong phap Larange tinh tham so y theo tham so cho truoc x
function [Fraction_result] = hamLarange(X, Y, cal_Point)
  %b?c ?a th?c
  iLevel = length(X);
  
  %bien phân th?c
  Fraction = 0;

  %vong lap 1 cho bi?n x_i ? m?u 
  for iDenominator=1:iLevel
    Denominator = 1;
    Numerator = Y(iDenominator);

    % vong lap 2 cho cac bien x_j ? t? và m?u
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
