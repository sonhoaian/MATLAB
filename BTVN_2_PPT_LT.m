classdef BTVN_2_PPT_LT <handle
    methods (Static)
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
         
         function [tichphan] = TichPhanGauss3Diem(canduoi, cantren, hamso, thuasotrongluong, doiso)
             
             %doi bien
             syms t;
             x = ((cantren - canduoi)*t + (cantren+canduoi))/2;
             gt = hamso(x);
             in_hamso = @(t) subs(gt,t);

             %tinh tich phan
             tichphan = ((cantren-canduoi)/2)*(thuasotrongluong(1)*in_hamso(0 - doiso(1)) + thuasotrongluong(2)*in_hamso(doiso(2)) + thuasotrongluong(1)*in_hamso(doiso(1)));
         end
    end
end