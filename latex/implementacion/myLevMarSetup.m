function [n,m,xk,Delta,funk,lambdak, maxit, maxit2, eps] = myLevMarSetup(fun,x0)
% editable
Delta = 3;
lambdak = 1; 
maxit = 50;
maxit2 = 10; % miteraciones maximas en hebden.m
eps = 0.001;

% no editable
n = length(x0);
m = length(fun(x0));
xk = x0;
funk = fun(xk)';

