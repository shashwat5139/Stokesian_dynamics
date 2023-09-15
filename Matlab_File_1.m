

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

% Two spheres sedimenting in a Newtonian fluid
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

FU=[0,0,-3,0,0,-3,0,0,-3,0,0,-3,0,0,0,0,0,0,0,0,0,0,0,0];

dt=0.01;

NSPHR=4;NDIM=6*NSPHR;Ng=3*NSPHR; 

X(1,1)=0;Y(1,1)=0;Z(1,1)=0;
X(2,1)=0;Y(2,1)=0;Z(2,1)=2.5;
X(3,1)=0;Y(3,1)=0;Z(3,1)=5;
X(4,1)=0;Y(4,1)=0;Z(4,1)=7.5;

for t=2:500
NEWTON2
X(1,t)=X(1,t-1)+UNEW(1)*dt;Y(1,t)=Y(1,t-1)+UNEW(2)*dt;Z(1,t)=Z(1,t-1)+UNEW(3)*dt;
X(2,t)=X(2,t-1)+UNEW(4)*dt;Y(2,t)=Y(2,t-1)+UNEW(5)*dt;Z(2,t)=Z(2,t-1)+UNEW(6)*dt;
X(3,t)=X(3,t-1)+UNEW(7)*dt;Y(3,t)=Y(3,t-1)+UNEW(8)*dt;Z(3,t)=Z(3,t-1)+UNEW(9)*dt;
X(4,t)=X(4,t-1)+UNEW(10)*dt;Y(4,t)=Y(4,t-1)+UNEW(11)*dt;Z(4,t)=Z(4,t-1)+UNEW(12)*dt;
t
end

plot3(X(1,500),Y(1,500),Z(1,500),'b*')
hold on
plot3(X(2,500),Y(2,500),Z(2,500),'r*')
plot3(X(3,500),Y(3,500),Z(3,500),'g*')
plot3(X(4,500),Y(4,500),Z(4,500),'y*')
grid on
axis square
