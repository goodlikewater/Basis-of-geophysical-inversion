x=-40:1:40;
y=-40:1:40;
R=15; %球体中心埋深(m)
B=50000; %本地磁场(nT)
k=0.015; %磁化率（SID
r=10; %球体半径(m)
vol=4*pi*r*r*r/3; %球体体积
mu0=4*pi*1e-7; %导磁率
m=k*B/mu0; %球体磁化强度
M=m*vol; %球体磁矩
A=45*pi/180;
I=0;

for i=1:size(x,2)
    for j=1:size(y,2)
        Hax(j,i)=(mu0/(4*pi))*M*((2*x(i)*x(i)-y(j)*y(j)-R*R)*cos(I)*cos(A)...
            -3*R*x(i)*sin(I)+3*x(i)*y(j)*cos(I)*sin(A))/((R^2+x(i)^2+y(j)^2)^2.5);
        Hay(j,i)=(mu0/(4*pi))* M *((2*y(j)*y(j)-x(i)*x(i)-R*R)*cos(I)*cos(A)...
            -3*R*y(j)*sin(I)+3*x(i)*y(j)*cos(I)*cos(A))/((R^2+x(i)^2+y(j)^2)^2.5);
        Za(j,i)=(mu0/(4*pi))* M *((2*R*R-x(i)*x(i)-y(j)*y(j))*sin(I)...
            -3*R*x(i)*cos(I)*cos(A)-3*R*y(j)*cos(I)*sin(A))/((R^2+x(i)^2+y(j)^2)^2.5);
        Delta_T(j,i)=(Hax (j,i)*cos(I)*cos(A)+Hay(j,i)*cos(I)*sin(A)+Za(j,i)*sin(I));
    end
end

figure()
subplot 221; contourf(x,y,Hax,12); axis xy; xlabel({'X/m';'(a) Ha_x 等值线图'});ylabel('Y/m'); colorbar;
subplot 222; contourf(x,y,Hay,12); axis xy; xlabel({'X/m';'(b) Ha_y 等值线图'});ylabel('Y/m'); colorbar;
subplot 223; contourf(x,y,Za,12); axis xy; xlabel({'X/m';'(c) Z_a 等值线图'});ylabel('Y/m'); colorbar;
subplot 224; contourf(x,y,Delta_T,12); axis xy; xlabel({'X/m';'(d) \Delta_T 等值线图'});ylabel('Y/m'); colorbar;
