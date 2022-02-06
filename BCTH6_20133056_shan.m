%ngay 24/12/2021 giai he phuong trinh tuyen tinh bằng phương pháp Gauss
clear , clearvars,  clc;
n = 2;% gia tri mau
format rational;

%du lieu test
matrixA = [0 45 1 ; 4 0 2; 8 1 6];
matrixB = [1; 1; 1];
%addMatrix = [matrixA matrixB]; %[181/356          3/89         -46/89 ]
%addMatrix = [0  2 3 4; 5 6 7 8; 9 1 2 3];%[0 -1 2]
addMatrix = [1 1 1 1; 1 2 4 -1; 1 3 9 1];%[7 - 8 2]
%addMatrix = [1 2 1 4 13;  2 0 4 3 28; 4 2 2 1 20;-3 1 3 2 6];
%addMatrix =[5 3 2 -2; 1 1 0 2; 2 -1 1 3];
mtraBD = addMatrix;
size_mtr = size(addMatrix);

%chuong trinh chinh
for i = 1: size_mtr(1)-1
    mtraBD = doidong(mtraBD, i);
    mtraBD = biendoisocap(mtraBD,i);
end
mtraBD
ketquax = hamthe(mtraBD);
format long;
fprintf("cac bien so can tim theo thu tu la \n")
for i = 1:length(ketquax)
    fprintf(" x[%d] = %f \n", i, ketquax(i));
end

%xet phan tu a_ii truoc khi goi ham doi dong
%neu phan tu a_ii = 0, ham se chay de hoan doi hai dong lien ke
function [matranbiendoi] = doidong(mtrA,dong)
    if(mtrA(dong, dong) ~= 0 )
        matranbiendoi = mtrA;
        return;
    end
    matranbiendoi = mtrA;
    isize = size(matranbiendoi);    
    for i = dong + 1 :isize(1)
        if(matranbiendoi(i, dong) ~= 0)
            matranbiendoi(i -1,:) = mtrA(i , :);
            matranbiendoi(i, :) = mtrA(dong, :);
        end
    end
end

%thuc hien phep bien doi so sap tren dong cua matran
%thamsodong dung de xacs dinh dong khong duoc bien doi trong  moi lan chay
%ham
function [a] = biendoisocap(matrix, thamsodong)
    isize = size(matrix);
    a = matrix;
    for i = thamsodong:isize(1) -1
        if(and( i ==isize(1) -1, a(i+1, thamsodong) ==  0)) 
            %xac dinh dong cuoi cung co bien so aij = 0
            return; 
        else
            thamso = matrix(thamsodong ,thamsodong)/a(i+1,thamsodong);
            a(i + 1, :) = a(i + 1, :)*thamso - a(thamsodong,:);
            break;
        end
    end
end

%ham bien doi jordan sau khi dua dung bien doi gaussian
function [a] = biendoisocap_Jordan(matrix)
    size_of = size(matrix);
    i = size_of(1);
    while (i > 1)        
        for j=1:i-1
            if(matrix(i -j,i) ~=0)
                thamso = matrix(i ,i)/matrix(i -j,i);
                matrix(i - j, :) =   matrix(i -j, :)*thamso - matrix(i,:);
            end
        end
        
        i = i -1;
    end
    a = matrix;
end

function [r_matrix] = ketqua(matrix)
%ham lay ket qua sau khi dung gauss Jordan
%ham nay khong dung duoc khi ma matran khong phai la matran duong cheo sau
%khi dung gauss-jordan
    siz = size(matrix);
    result = zeros(1:siz(1));
    for i = 1:siz(1)
        result(i) = matrix(i,siz(2))/matrix(i,i);
    end
    r_matrix = result;
end

% lay gia tri x[i] sau khi tính toán
function [a] = hamthe(matrix)
    isize = size(matrix);
    result(isize(1)) = matrix(isize(1), isize(2))/matrix(isize(1),isize(1));
    for i = isize(1) - 1: -1: 1
        sum = 0;
        for j = i + 1:isize(1)
            sum = sum + matrix(i, j)*result(j);
        end
        result(i) = (matrix(i, isize(2)) - sum)/matrix(i, i);
    end
    a = result;
end