%%
clc
 A = [0 0 0 1];
 B = [1 0 0 1];
 C = [0 1 0 1];
D = [1 1 0 1]
P = [A;C;D;B;A];
plot(P(:,1),P(:,2),'r');
hold on

tx=sum(P(:,1))/4;
ty=sum(P(:,2))/4;
tz=sum(P(:,3))/4;

T=[1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     tx ty tz 1];
R=T;
theta=pi/3;
rotate_zaxis=[cos(theta),sin(theta),0,0;
            -1*sin(theta),cos(theta),0,0;
            0,0,1,0;
            0,0,0,1];
R=rotate_zaxis*R;
tx=-sum(P(:,1))/4;
ty=-sum(P(:,2))/4;
tz=-sum(P(:,3))/4;
T=[1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     tx ty tz 1];
R=T*R;
nP=P*R;
plot(nP(:,1),nP(:,2),'r');