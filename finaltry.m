%%
axis([0 20 0 20])
grid minor
hold on 
n=1;
d=3;
but=1;
 while but==1
    [x,y,but]=ginput(1);
     plot(x,y,'*');
    point(:,n)=[x,y];
     n=n+1;
 end
n=length(point);
uVec=[]
for i=0:n+d
    uVec(:,i+1)=i/(n+d-1);
end
x=0;
basis=0;
y=0;
pu=[]
j=1;
for u=0:0.001:1
    x=0;
    y=0;
    for i=0:n-1
        
        basis=blend(uVec,u,i+1,d);
        x=x+basis*point(1,i+1);
        y=y+basis*point(2,i+1);
    end
    pu(:,j)=[x,y];
    j=j+1;
end
plot(pu(1,1:end-1),pu(2,1:end-1));
