clear, clearvars, clc;
%linear equations
%-T(0) + 2.04T(2) – T(4)    = 0.8
%-T(2) + 2.04T(4) – T(6)    = 0.8
%-T(4) + 2.04T(6) – T(8)    = 0.8
%-T(6) + 2.04T(8) – T(10)  = 0.8

%coefficient matrix
MatrixA=[2.04 -1 0 0;-1 2.04 -1 0;0 -1 2.04 -1;0 0 -1 2.04];

%result matrix
MatrixB = [40.8; 0.8; 0.8; 200.8];

function x = PPGauss(mtrA,mtrB)
    %m is the number of rows, n is the number of columns
    [m,n] = size(mtrA);
    
    %ccheck wheather mtrA is square or not
    if m~=n 
        error('Ma tran he so phai la ma tran vuong'); 
    end
    
    nb = n+1;
    
    %create dependent matrix from mtrA, mtrB
    ProcMatrix = [mtrA mtrB];
    
    %eliminate coefficient
    for iCols = 1:n-1
        for iRows = iCols+1:n
            thamso = ProcMatrix(iRows, iCols)/ProcMatrix(iCols,iCols);
            ProcMatrix(iRows,iCols:nb) = ProcMatrix(iRows,iCols:nb)-thamso*ProcMatrix(iCols,iCols:nb);
        end
    end
    
    % solve linear equations matrix
    x = zeros(n,1);
    x(n) = ProcMatrix(n,nb)/ProcMatrix(n,n);
    
    %export result
    for i = n-1:-1:1
        x(i) = (ProcMatrix(i,nb)-ProcMatrix(i,i+1:n)*x(i+1:n))/ProcMatrix(i,i);
    end
end

result = PPGauss(MatrixA,MatrixB);
for iResult = 1: length(result)
     fprintf(' x[%d] = %f \n', iResult, result(iResult));
end

distance = 2;
x = 0:distance:10;
checkFunc = @(x) ( 73.4523*e.^(0.1*x) - 53.4523*e.^( -0.1*x) + 20);
figure;
plot(x, [0 transpose(result) 200], 'LineWidth', 2, x, checkFunc(x), 'LineWidth', 2);
grid on;
legend('calculation', 'T - prediction');