clear, clearvars, clc;

%setting
format long;

H=2; %buoc tien noi suy

%gia tri x, y
x = 2:H:10;
y = [0.30902 0.58778 0.80902 0.95106 1];
D= zeros(length(x),1);

%tinh ban sai phan
for I = 1:length(x)
    D(I,1) = y(I) ;
end
for J = 2: length(x)
    for I = 1:length(x)-J+1
        D(I,J)=D(I+1 , J-1) - D(I, J-1);
    end
end

% tinh gia tri noi suy
XX = 5;
bac = 3;
XT =1;
FINT = D(1,1);
K = 1;
for J =1:bac
    K = K*(J);
    XT=XT*( XX - x(J));
    FINT=FINT+ D(1,J+1)*XT/ (K*H^J);
end

E = (((XX - x(1))*(XX -x(2))*(XX-x(3))* (XX -x(4)))/(K))*abs(max(abs(D(:,5)))/2^4);
%trinh bay ket qua
fprintf('gia tri y can tim tại x = %f la %.7d \n', 5,FINT)
fprintf('bang sai phan\n');
disp(D)
disp('sai so cua uoc luong la ');
disp(E);
format default;
