clear, clearvars, clc;
format long
syms x0;
%Du lieu dau vao
x= [0 2.3 4.9 9.1 13.7 18.3 22.9 27.2];
y= [22.8 22.8 22.8 20.6 13.9 11.7 11.1 11.1];

%tao cac moc noi suy
vMocNoiSuyx = linspace(0, 27.2);

%lay gia tri tuong quan va bac ham so 
vHeSoTuongQuan = spline(x,y);
vHeSo = vHeSoTuongQuan.coefs(4,:);

%lay cac he so tuong quan T va Z theo cot
HeSoa = vHeSoTuongQuan.coefs(:,1);
HeSob = vHeSoTuongQuan.coefs(:,2);
HeSoc = vHeSoTuongQuan.coefs(:,3);
HeSod = vHeSoTuongQuan.coefs(:,4);

%tinh dao ham bac 1 va bac 2
for k = 1:length(vMocNoiSuyx) %perform interpolations at desired values
    [HamSof(k), dDaoHam1(k), dDaoHam2(k)] = NoiSuyGiaTri(x,length(x),HeSoa,HeSob,HeSoc,HeSod,vMocNoiSuyx(k));
end

% Ve do thi
straighline = 11.35133820;
subplot(1,3,1)
plot(y, x,'o',HamSof,vMocNoiSuyx,'r');
title('T(z)');
xlabel('T(z)^oC');
ylabel('z (m)');
set(gca,'YDir','reverse'),grid
subplot(1,3,2),plot(dDaoHam1,vMocNoiSuyx)
title('dT/dz');
xlabel('dT/dz');
ylabel('z (m)');
set(gca,'YDir','reverse'),grid
subplot(1,3,3),plot(dDaoHam2,vMocNoiSuyx);
title('d^2T/dz^2');
xlabel('d^2T/dz^2');
ylabel('z (m)');
set(gca,'YDir','reverse'),grid

%tinh toan gia tri
dThamSox = x0-x(4);
fHamSo = vHeSo(1)*dThamSox^3 + vHeSo(2)*dThamSox^2+vHeSo(3)*dThamSox + vHeSo(4);

dGiaTriX =solve ((diff(vHeSo(1)*dThamSox^3 + vHeSo(2)*dThamSox^2+vHeSo(3)*dThamSox + vHeSo(4),2) == 0));
fprintf('gia tri do sau can tim %.8f \n',double(dGiaTriX));
fprintf('nhiet do o do sau %.8f la: ',double(dGiaTriX));
fCal = @(x) subs(fHamSo,x);
disp(double(fCal(dGiaTriX)));

%tinh cac gia tri noi suy
function [HamSo,dDaoHamB1, dDaoHamB2]=NoiSuyGiaTri(vBienDocLap, iSoLuongBien, dHeSoa, dHeSob, dHeSoc, dHeSod, dMocNoiSuyThui)
  for i = 1:iSoLuongBien - 1
    if dMocNoiSuyThui >= vBienDocLap(i) - 0.000001 && dMocNoiSuyThui <= vBienDocLap(i + 1) + 0.000001      
      HamSo=dHeSod(i)+dHeSoc(i)*(dMocNoiSuyThui-vBienDocLap(i))+dHeSob(i)*(dMocNoiSuyThui-vBienDocLap(i))^2+dHeSoa(i)*(dMocNoiSuyThui-vBienDocLap(i))^3;
      dDaoHamB1=dHeSoc(i)+2*dHeSob(i)*(dMocNoiSuyThui-vBienDocLap(i))+3*dHeSoa(i)*(dMocNoiSuyThui-vBienDocLap(i))^2;
      dDaoHamB2=2*dHeSob(i)+6*dHeSoa(i)*(dMocNoiSuyThui-vBienDocLap(i));
      break
   end
  end
end
