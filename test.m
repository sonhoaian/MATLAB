clear , clearvars, clc;
m = 1; 
k=0.3; 
c=0.2;
t= 0:0.01:40;
Hamf=@(t,X)  ([ X(2); -(k/m)*X(1)-(c/m)*X(2)]);
[t1, y] =ode45(Hamf, t, [1 0]); %trong[ ] là?k ??utheoth?t?x,v% 
x= y(:,1); 
v=y(:,2);
figure; 
axis([0 40 -1 1]);
hold on
for i=1:5:length(t)
  plot(t1(i),x(i),'ob',t1(i),v(i),'*r','MarkerSize',2)
  pause(0.05);
  hold on  
 end