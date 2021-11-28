%%
function bspline
n=input('Enter the number of control points'); 
order=input('Enter the order of B-spline curve'); 
if (nargin ~= 2)
	order = 4;
end
nplot = 100;
if (n < order)
	disp('Order should be less than/equal to n+1');
	return;
end
%plotting the data
figure(1);
hold on;
grid on;
box on;
xlabel('X'),ylabel('Y')
t = linspace(0,1,nplot);
for i = 1:n	
	title(['Choose the control point number :', num2str(i)]);
	p(i,:) = ginput(1);
	hold off;
	plot(p(:,1),p(:,2),'k-');
	axis([0 1 0 1]);
	hold on; box on; grid on; xlabel('X'); ylabel('Y');
	if (i  >= order) 
		T = linspace(0,1,i-order+2);
		y = linspace(0,1,1000);
		p_spl = Nik(T,p,y,order);
		plot(p_spl(:,1),p_spl(:,2),'b-');
	end
	plot(p(:,1),p(:,2),'ro','MarkerSize',2,'MarkerFaceColor','r');
end
title(['B-Spline-curve with ',num2str(n),' control points of order ',num2str(order)]);
function val = Nik(T,p,y,order)
m = size(p,1);
n = length(y);
X = zeros(order,order);
Y = zeros(order,order);
a = T(1);
b = T(end);
T = [ones(1,order-1)*a,T,ones(1,order-1)*b];
for l = 1:n
    t0 = y(l);
    id = find(t0 >= T);
    k = id(end);
		if (k > m)
			return;
		end
    X(:,1) = p(k-order+1:k,1);
    Y(:,1) = p(k-order+1:k,2);

    for i = 2:order
        for j = i:order
            num = t0-T(k-order+j);
            if num == 0
                weight = 0;
            else
				s = T(k+j-i+1)-T(k-order+j);
                weight = num/s;
            end
            X(j,i) = (1-weight)*X(j-1,i-1) + weight*X(j,i-1);
            Y(j,i) = (1-weight)*Y(j-1,i-1) + weight*Y(j,i-1);
        end
    end
    val(l,1) = X(order,order);
    val(l,2) = Y(order,order); %#ok<*AGROW>
end
