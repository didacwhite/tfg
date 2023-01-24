d = linspace(0,1);


fun = @(r) r(1).*d.^2 + r(2).*d;

x0 = [1,2];

% Jacobian functor
J = @(x,h,F)(F(repmat(x,size(x'))+diag(h))-F(repmat(x,size(x'))))./h';
% Your function
% f = @(x)[x(1)^2 + x(2)^2; x(1)^3.*x(2)^3];
% Point at which to estimate it
%x = [1;1];
% Step to take on each dimension (has to be small enough for precision)
h = 1e-5*ones(size(x));
% Compute the jacobian
Jk = J(x0',h,fun)';
Jk(:,1)