which -all syms
syms K;
format long;
X = [4.9 9.1 13.7 18.3];
Y = [22.8 20.6 13.9 11.7];
a = (hamLarange(X,Y,K));
a1 = @(K) subs(a, K);
b = int(a);
b
b1 = @(K) subs(b,K);
b2 = @(K) subs(int(int(a)),K);
b2
%c = int(b);
subplot(1,3,1);
plot(a1(X),X);grid
subplot(1,3,2);
plot(b1(X),X);grid
subplot(1,3,3);
plot(X , b2(X));grid
%subplot(1,3,2);plot(b,X);grid on;
%subplot(1,3,3);plot(c,X);grid on;
%solve(a,x,0);
%vpasolve(a ==0)

function [Fraction_result] = hamLarange(X, Y, cal_Point)

  %b?c ?a th?c
  iLevel = length(X);
  
  %bien phân th?c
  Fraction = 0;

  %vong lap 1 cho bi?n x_i ? m?u 
  for iDenominator=1:iLevel
    Denominator = 1;
    Numerator = 0;

    % vong lap 2 cho cac bien x_j ? t? và m?u
    for iNumerator= 1:iLevel
      if iNumerator ~= iDenominator
        Numerator = Numerator+2*(cal_Point - X(iNumerator));
        Denominator = Denominator*(X(iDenominator)-X(iNumerator));
      end
    end    

    %cong don ket qua
    Fraction = Fraction + Y(iDenominator)*Numerator/Denominator;
  end

  %tra ket qua ra ben ngoai
  Fraction_result = Fraction;
end