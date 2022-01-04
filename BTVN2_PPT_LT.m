clear all, clc;
iSotam = 32;
canduoi=0;
cantren=0.5;
trongluong = [0.55555, 0.88888];
doiso = [0.77460, 0.00];

fHamSo = @(x) (100.*exp(-(x.*2)).*(sin(x.*2*pi)).^2);

k = 0:(cantren-canduoi)/iSotam:0.5;%tham so tinh toan

%tham so do thi
dStep = 1/720;
m = canduoi:dStep:cantren;
for i = 1:iSotam -1
    plot([i*(cantren-canduoi)/iSotam i*(cantren-canduoi)/iSotam],[0 sqrt(fHamSo(k(i+1)))]);
    hold on;
end
plot(m,sqrt(fHamSo(m)));
title("minh hoa phuong phap SimpSon 1/3 với n = 36")
hold off;
fprintf("gia tri cua I_rms bang phuong phap 1/3 SimpSon la %1.10f \n", sqrt(BTVN_2_PPT_LT.TichPhanSimpson13(canduoi, cantren,iSotam, fHamSo)));
fprintf("gia tri cua I_rms bang phuong phap phuong cau Gauss 3 diem la %1.10f \n", sqrt(BTVN_2_PPT_LT.TichPhanGauss3Diem(canduoi, cantren,fHamSo,trongluong, doiso)));