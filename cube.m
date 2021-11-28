%%
% Assuming axis be z=x; And rotation angle be 90 degree
clc
clear all



 A = [0 0 0];
 B = [1 0 0];
 C = [0 1 0];
 D = [0 0 1];
 E = [0 1 1];
 F = [1 0 1];
 G = [1 1 0];
 H = [1 1 1];
 P = [A;B;F;H;G;C;A;D;E;H;F;D;E;C;G;B];
 p=[A;B;C;D;E;F;G;H];
 plot3(P(:,1),P(:,2),P(:,3),'r');
 hold on
 
 tx=sum(p(:,1))/8;
 ty=sum(p(:,2))/8;
 tz=sum(p(:,3))/8;

 T=[1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     tx ty tz 1];
R=T;
theta=pi/4;
rotate_yaxis=[cos(theta),0,-1*sin(theta),0;
                0,1,0,0;
                sin(theta),0,cos(theta),0;
                0,0,0,1];
R=rotate_yaxis*R;
theta=pi/2;
rotate_zaxis=[cos(theta),sin(theta),0,0;
            -1*sin(theta),cos(theta),0,0;
            0,0,1,0;
            0,0,0,1];
R=rotate_zaxis*R;
theta=-1*pi/4;
rotate_yaxis=[cos(theta),0,-1*sin(theta),0;
                0,1,0,0;
                sin(theta),0,cos(theta),0;
                0,0,0,1];
R=rotate_yaxis*R;

tx=-sum(p(:,1))/8;
ty=-sum(p(:,2))/8;
tz=-sum(p(:,3))/8;
 T=[1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     tx ty tz 1];
R=T*R;
newp=[P,ones(16,1)];
P=newp*R;
plot3(P(:,1),P(:,2),P(:,3),'b');
xlabel('x');
ylabel('y');
zlabel('z');
legend('before rotation','after rotation');