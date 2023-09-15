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

FU=[0,0,-10,0,0,-10,0,0,0,0,0,0];

X(1)=0;Y(1)=1;Z(1)=0;X(2)=0;Y(2)=0;Z(2)=3;

dt=0.1;

NSPHR=2;NDIM=6*NSPHR;Ng=3*NSPHR;

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

X(1,1)=0;Y(1,1)=1;Z(1,1)=0;
X(2,1)=0;Y(2,1)=0;Z(2,1)=3;

for t=2:100
NEWTON2
X(1,t)=X(1,t-1)+UNEW(1)*dt;Y(1,t)=Y(1,t-1)+UNEW(2)*dt;Z(1,t)=Z(1,t-1)+UNEW(3)*dt;
X(2,t)=X(2,t-1)+UNEW(4)*dt;Y(2,t)=Y(2,t-1)+UNEW(5)*dt;Z(2,t)=Z(2,t-1)+UNEW(6)*dt;
t
end

figure(1)
plot(Y(2,:),Z(2,:),'r')
hold on
plot(Y(1,:),Z(1,:),'g')
grid on
axis square

