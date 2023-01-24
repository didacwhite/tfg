function J = jacob(fun,xk)
h = 1e-5;
n = length(xk);
m = length(fun(xk));
J = zeros(n,m);
for j = 1:m
    hj = zeros(1,n);
    hj(j) = h;
    %fun(xk+hj)
    %fun(xk)
    J(:,j) = (fun(xk+hj)-fun(xk))./h;
end
