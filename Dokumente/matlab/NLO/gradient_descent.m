function [min, n_iterations] = GradientDescent(f, grad, alpha, sigma, alpha_0, maxiter, starting_point)
%% GradientDescent - find a minimum of a function
% Finds a minimum of given function f, iterates until the Armijo condition
% fulfills. 


[fk, gk] = feval(f,x);
xx = x;
x = x + alpha*d;
fk1 = feval(f,x);
while fk1 > fk + c*alpha*(gk'*d);
  alpha = alpha*rho;
  x = xx + alpha*d;
  fk1 = feval(f,x);
end

progress = @(iter,x) fprintf('iter = %3d: x = %-32s, F(x) = %f\n', ...
    iter, mat2str(x,6), F(x));

iter = 0;
    function [d_k] = d(grad, x);
        d_k = -grad(x)./norm(grad(x));
    end

cur_x = f(starting_point);
while iter < max_iter
   prev_x = cur_x;
   cur_x = prev_x + d_k(grad, x)*alpha;
   iter += 1;
end
end

    


