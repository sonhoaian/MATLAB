
syms x;
format long
isokhoang = 1000;
cantren = 2;
canduoi = 0;
f = @(x) (pi*(1+(x/2)^2)^2);
tichphan = TichPhanHinhThang(cantren, canduoi, isokhoang,f);
pretty(tichphan)

%Tinh toan bang phuong phap hinh thang
function [TongHinhThang] = TichPhanHinhThang( cantren, canduoi, iSoKhoang, fHamSo)
    syms x;
    dDeltaH = abs(cantren - canduoi)/(iSoKhoang);
    dTongTichPhan = fHamSo(canduoi) + fHamSo(cantren);
    dh = diff(fHamSo(x),2);
    dhHamSo = @(x) subs(dh,x);
    dSumdhHamSo = dhHamSo(canduoi) + dhHamSo(cantren);
    for i = 1:(iSoKhoang-1)
        k = canduoi + ( i * dDeltaH);
        dTongTichPhan = dTongTichPhan + 2 * fHamSo(k);
        dSumdhHamSo = dSumdhHamSo + dhHamSo(k);
    end    
    dTongTichPhan = dDeltaH*dTongTichPhan/2 + (-1/12)*(cantren-canduoi)*((dDeltaH)^2)*dSumdhHamSo/(iSoKhoang);
    TongHinhThang = dTongTichPhan;
end