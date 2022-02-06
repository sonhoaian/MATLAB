% Compute best fit of transformed values
clear, clearvars, clc;
U=[0.5 2 10 0.5 2 10 0.5 2 10]';
H=[0.15 0.15 0.15 0.3 0.3 0.3 0.5 0.5 0.5]';
KL=[0.48 3.9 57 0.85 5 77 0.8 9 92]';

%standardization data using ln (log)_e
logU=log(U);logH=log(H);logKL=log(KL);

%using linear regression to explore data
%create matrix for solving coefficent number
%ones(size(logKL) create matrix ones(n,1) for coe of a0
CoeMatrix=[ones(size(logKL)) logU logH];

%solve coeffient
coeMatrix=(transpose(CoeMatrix)*CoeMatrix)\(transpose(CoeMatrix)*logKL);
%coeMatrix=CoeMatrix'*CoeMatrix\CoeMatrix'*logKL;

%solve for log10 of a0
coeMatrix(1) = exp(coeMatrix(1));
disp('cac he so lan luot la: ');
for i=1: length(coeMatrix)
  fprintf('a%d = %f \n', i - 1, coeMatrix(i));
end