function [Jk,Dk,v] = JDk(fun,xk,dkm1)

Jk = jacob(fun,xk);

% Compute diagonal of Dk
di = @(i) max(dkm1(i),norm(Jk(:,i)));

v = arrayfun(di, 1:length(xk));
Dk = diag(v);