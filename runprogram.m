clear all, clc, syms x;
%Khai bao bien va ham so
iSotam = 11;
canduoi=0;
cantren=2;
fHamSo = @(x)(pi*(1+(x/2)^2)^2);
dDeltaH = (cantren - canduoi)/iSotam;
format long;

%tinh toan tich phan bang phuong phap Simpson
%Neu nguoi dung nhap so tam chan su dung (I), neu le dung (II)
if(mod(iSotam,2) == 0)
    tichphan = TichPhanSimpson13(canduoi, cantren, iSotam, fHamSo); % (I)
else
    % (II) su dung ket hop simpson 1/3 và 3/8
    tichphan = TichPhanSimpson13(canduoi , cantren - 3*dDeltaH, iSotam - 3, fHamSo);
    tichphan = tichphan + TichPhanSimpson38(cantren - 3*dDeltaH, cantren, 3 , fHamSo);
end

%hien thi ket qua
fprintf("Gia tri tich phan %s tu %d den %d la %2.10f \n" , fHamSo(x), canduoi, cantren, tichphan);

% tra lai cai dat ban dau
format bank

function [tichphan] = TichPhanSimpson38(canduoi, cantren, sotam, hamso)
    dKhoangCach = (cantren-canduoi)/sotam;
    S = hamso(canduoi) + hamso(cantren) + 3*(hamso(canduoi + 1*dKhoangCach) + hamso(canduoi + 2*dKhoangCach));    
    tichphan = S*dKhoangCach*3/8;
end

function [tichphan] = TichPhanSimpson13(canduoi, cantren, sotam, hamso)
    S = hamso(canduoi) + hamso(cantren);
    dKhoangCach = (cantren-canduoi)/sotam;
    for i = 1:sotam-1
        if(mod(i,2) == 0)
            S = S + 2*hamso(canduoi + i*dKhoangCach);
        else
            S = S + 4*hamso(canduoi + i*dKhoangCach);
        end
    end
    tichphan = S*dKhoangCach/3;
end

