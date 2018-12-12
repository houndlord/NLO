n = 4;
h = 2;
b = ones(16, 1)
D = (1/h^2)*spdiags([-ones(n,1),2*ones(n,1), -ones(n,1)], [-1 0 1], n, n);
A = kron(speye(n),D)+kron(D,speye(n))
%A*b;

%print(A)
%print(D)
%A/b
%m, i = CGGradientDescent(A, x, b, 1e-6)
x_0 = ones(16, 1);
f = cgs(A, b, 1e-6);
f
[min , iter, error] = CGGradientDescent(A, x_0, b, 1e-6, f)
%min
%x = A / b;
%x
%a = min - x;
%a


function [min, iter, error] = CGGradientDescent(A, x, b, tolerance, f)
%% Gradient descent
%iter = 0

function y = inner(a,b)
% This is a MatLab function to compute the inner product of
% two vectors a and b.  x_0 = ones(16, 2, 1);
d = -g;
% By Ralph Howard on 1/12/98
% Call syntax: y = inner(a,b) or inner(a,b)
% Input: The two vectors a and b 
% Output: The value of the inner product of a and b.
c=0;			% intialize the variable c
n= length(a);		% get the lenght of the vector a
for k=1:n		% start the loop
	c=c+a(k)*b(k);	% update c by the k-th product in inner product
end			% end loop
y = c;			% print value of c = inner product
end



g = A*x + b;
g_0 = g;
%x_0 = ones(16, 2, 1);
d = -g;
%i = 0;

%while norm(g) <= tolerance * norm(g_0)
for i=1:15
    z = A*d;
    
    alpha = norm(g)^2 / inner(z, d);
    
    g = A*x + b;
    x = x + alpha*d;
    
    beta = norm(g + alpha*z)^2 / norm(g)^2;
    d = -(g + alpha*z) + beta*d;
    min = -x;
    error = f- x;
    %i = i+1;
    %iter = i;
    if norm(g) <= tolerance * norm(g_0)
        break;
    end
    if i > 10
        break;
    end
      
end
%min = x;
iter = i;
end



