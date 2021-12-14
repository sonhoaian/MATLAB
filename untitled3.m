z = [0 2.3 4.9 9.1 13.7 18.3 22.9 27.2];
T=[22.8 22.8 22.8 20.6 13.9 11.7 11.1 11.1];
%cai dat ban dau
clear alls;
format long;
syms x;

X=[0 2.3 4.9 9.1 13.7 18.3 22.9 27.2];
Y=[22.8 22.8 22.8 20.6 13.9 11.7 11.1 11.1];

%tham s? c?n tính
X_cal = 1.5;

if ((length(X)*length(Y) < 4) || (length (X) ~= length(Y)))
  fprintf("tham so dau vao khong hop le\n");
  return ;
else
  fprintf("bai tap 1\n");
  result = hamLarange(X, Y, x);
  
  plot(diff(result),X);
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

%tinh sai phân
%func g?m 6 bien: matran X/Y, diem can tinh - X_point, dong va co sai phan, buoc nhay giua cac gia trin x - x_step
function [matrix_saiphan, saiso] = saiphan(X_matrix, Y_matrix, X_point, dong_saiphan, cot_saiphan, x_step)
  matrix_size=length(X_matrix);

  %ma tran  sai phan
  A_matrix=zeros(matrix_size, matrix_size-1);
  for i=1 : matrix_size-1
      A_matrix(i,1)=Y_matrix(i+1)-Y_matrix(i); %Sai phân b?c 1
  end

  %Tính sai phân t? b?c 2 tr? lên
  for j=2:matrix_size-1
      for i=1:matrix_size-j
           A_matrix(i,j)=A_matrix(i+1,j-1)-A_matrix(i,j-1);
      end
  end
  
  %Tính sai s?
  %bien sai phan
  ESP = 1;

  %mau so sai phan
  Fac_pwr_ste = 1;
  for iLevel = 1:cot_saiphan
    ESP = ESP*(X_point - X_matrix(iLevel));
    Fac_pwr_ste = Fac_pwr_ste*iLevel*x_step;
  end
  saiso = ESP*A_matrix(dong_saiphan, cot_saiphan)/Fac_pwr_ste;
  matrix_saiphan = A_matrix;
end
%return cai dat he thong



