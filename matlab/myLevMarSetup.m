function [n,m,xk,Delta,funk,lambdak, maxit, maxit2] = myLevMarSetup(fun,x0)
% editable
Delta = 3;
lambdak = 1; 
maxit = 50;
maxit2 = 10; % miteraciones máximas en hebden.m


n = length(x0);
m = length(fun(x0));
xk = x0;
funk = fun(xk)';

