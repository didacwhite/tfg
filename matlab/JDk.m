function [Jk,Dk,v] = JDk(fun,xk,dkm1)

% Jacobian functor
%J = @(x,h,F)(F(repmat(x,size(x'))+diag(h))-F(repmat(x,size(x'))-diag(h)))./(2.*h');

% Step to take on each dimension (has to be small enough for precision)
%h = 1e-3*ones(size(xk));
%diag(h)
% Compute the jacobian
%Jk = J(xk',h,fun)'
Jk = jacob(fun,xk);

% Compute diagonal of Dk
di = @(i) max(dkm1(i),norm(Jk(:,i)));

v = arrayfun(di, 1:length(xk));
Dk = diag(v);