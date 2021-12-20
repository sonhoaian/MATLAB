h = 0.25;
x = 0.00 : 0.25 : 2.00;
y = [0 0.3210 0.8244 1.5878 2.7183 4.3629 6.7225 10.0706 14.7781];
a = TichPhanHinhThang_F(x,y, h)
function [TongHinhThang] = TichPhanHinhThang_F(X_Value, Y_value, iKhoangCach)
    syms x;
    iSoKhoang = mod((max(X_Value) - min(X_Value)),iKhoangCach);
    %dDeltaH = abs(cantren - canduoi)/(iSoKhoang);
    dTongTichPhan = Y_value(1) + Y_value(length(Y_value));
    %dh = diff(fHamSo(x),2);
    %dhHamSo = @(x) subs(dh,x);
    %dSumdhHamSo = X_Value(1) + X_Value(length(X_Value));
    for i = 2:(iSoKhoang-1)
        %k = canduoi + ( i * dDeltaH);
        dTongTichPhan = dTongTichPhan + 2 * Y_value(i);
        %dSumdhHamSo = dSumdhHamSo + dhHamSo(k);
    end    
    dTongTichPhan = iKhoangCach*dTongTichPhan/2 ;
    TongHinhThang = dTongTichPhan;
end