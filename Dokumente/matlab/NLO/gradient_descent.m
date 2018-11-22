function [min, n_iterations] = GradientDescent(f, alpha, sigma)
%% GradientDescent - finde a minimum of function
% Finds a minimum of given function f, iterates until ther Armijo condition
% fulfills. 
iter = 0

