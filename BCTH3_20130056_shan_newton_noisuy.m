clear all  clc;

%setting
format long;

%declare variable/functions
esp = 5*10^(-5);
X0 =[2;0.25];
iloop = 0;
Delta_X = ones(2) + esp;

fx = @(x,y) (x^2 - 2*x - y +0.5);
dh_fx_x = @(x,y) (2*x - 2);
dh_fx_y = @(x,y) (-1);

gx = @(x,y) (x^2 + 4*y^2 - 4);
dh_gx_x = @(x,y) (2*x);
dh_gx_y = @(x,y) (8*y);


while(abs(Delta_X(1)) > esp && abs(Delta_X(2)) > esp)
    iloop = iloop + 1;
    x0 = X0(1); y0 = X0(2);
    %partial derivative matris
    Mx = [dh_fx_x(x0, y0), dh_fx_y(x0, y0);dh_gx_x(x0, y0), dh_gx_y(x0, y0)];
    
    %matrix of coefficient number
    F_xy = [-fx(x0,y0);-gx(x0, y0)];
    
    %print F_xy, Mx matrixes
%     disp(Mx);
%     disp(F_xy);
    
    %delta x
    Delta_X = Mx\F_xy;%%dung tam giai quye bang phuong phap Gauss
    X1 = X0 + Delta_X;
    X0 =X1;    
end
    fprintf("the number of loops is %d\n", iloop);
    disp("the result is");
    fprintf('y = %.10f\n', X0(1));
    fprintf('y = %.10f\n', X0(2));
    disp("--------------------------");
% return setting
format short;