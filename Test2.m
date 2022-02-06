clear alls
clc
U=[0.5 2 10 0.5 2 10 0.5 2 10]';
H=[0.15 0.15 0.15 0.3 0.3 0.3 0.5 0.5 0.5]';
KL=[0.48 3.9 57 0.85 5 77 0.8 9 92]';
logU=log(U);
logH=log(H);
logKL=log(KL);
X=[ones(length(log(U)),1) log(U) log(H)];
Y=log(KL);
DX=X'*X\X'*Y;
disp(DX);