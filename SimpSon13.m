clear all, clc;
iSotam = 100;
canduoi=0;
cantren=0.5;

fHamSo = @(x) (100.*exp(-(x.*2)).*(sin(x.*2*pi)).^2);
fHamSo
k = 0:(cantren-canduoi)/iSotam:0.5;
plot(k,fHamSo(k))
fprintf("Gia tri của I_rms bang cach dung thuat toan simpson 1/3 là %1.10f ", sqrt(TichPhanSimpson13(canduoi, cantren,iSotam, fHamSo)));

%------------------------
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