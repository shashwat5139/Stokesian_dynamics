clear X Y Z
clear 

KroneckerDelta=eye(3);

Signature=zeros(3,3,3);
Signature(1,2,3)=1;
Signature(2,3,1)=1;
Signature(3,1,2)=1;
Signature(2,1,3)=-1;
Signature(3,2,1)=-1;
Signature(1,3,2)=-1;

% Two spheres sedimenting in a Newtonian fluid. 
% The y-component of the line of centers causes the spheres to have lateral motion as they fall


m = csvread('data.dat');
for i=1:47
RSS(i)=m(i,1);
X11AS(i)=m(i,2); 
X12AS(i)=m(i,3); 
Y11AS(i)=m(i,4); 
Y12AS(i)=m(i,5); 
Y11BS(i)=m(i,6);  
Y12BS(i)=m(i,7);  
X11CS(i)=m(i,8);  
X12CS(i)=m(i,9); 
Y11CS(i)=m(i,10); 
Y12CS(i)=m(i,11);
end

FU=[0,0,-30,0,0,-30,0,0,-30,0,0,-30,0,0,-30,0,0,-30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

X(1,1)=3*cos(pi/3.);Y(1,1)=3*sin(pi/3.);Z(1,1)=1;
X(2,1)=3*cos(2*pi/3.);Y(2,1)=3*sin(2*pi/3.);Z(2,1)=0;
X(3,1)=3*cos(pi);Y(3,1)=3*sin(pi);Z(3,1)=1;
X(4,1)=3*cos(4*pi/3.);Y(4,1)=3*sin(4*pi/3.);Z(4,1)=0;
X(5,1)=3*cos(5*pi/3.);Y(5,1)=3*sin(5*pi/3.);Z(5,1)=1;
X(6,1)=3*cos(2*pi);Y(6,1)=3*sin(2*pi);Z(6,1)=0;

dt=0.01;

NSPHR=6;NDIM=6*NSPHR;Ng=3*NSPHR; 

for t=2:340
NEWTON2
X(1,t)=X(1,t-1)+UNEW(1)*dt;Y(1,t)=Y(1,t-1)+UNEW(2)*dt;Z(1,t)=Z(1,t-1)+UNEW(3)*dt;
X(2,t)=X(2,t-1)+UNEW(4)*dt;Y(2,t)=Y(2,t-1)+UNEW(5)*dt;Z(2,t)=Z(2,t-1)+UNEW(6)*dt;
X(3,t)=X(3,t-1)+UNEW(7)*dt;Y(3,t)=Y(3,t-1)+UNEW(8)*dt;Z(3,t)=Z(3,t-1)+UNEW(9)*dt;
X(4,t)=X(4,t-1)+UNEW(10)*dt;Y(4,t)=Y(4,t-1)+UNEW(11)*dt;Z(4,t)=Z(4,t-1)+UNEW(12)*dt;
X(5,t)=X(5,t-1)+UNEW(13)*dt;Y(5,t)=Y(5,t-1)+UNEW(14)*dt;Z(5,t)=Z(5,t-1)+UNEW(15)*dt;
X(6,t)=X(6,t-1)+UNEW(16)*dt;Y(6,t)=Y(6,t-1)+UNEW(17)*dt;Z(6,t)=Z(6,t-1)+UNEW(18)*dt;

t
end


plot3(X(1,:),Y(1,:),Z(1,:),'r')
hold on
plot3(X(2,:),Y(2,:),Z(2,:),'b')
plot3(X(3,:),Y(3,:),Z(3,:),'y')
plot3(X(4,:),Y(4,:),Z(4,:),'g')
plot3(X(5,:),Y(5,:),Z(5,:),'m')
plot3(X(6,:),Y(6,:),Z(6,:),'c')
grid on
axis square

