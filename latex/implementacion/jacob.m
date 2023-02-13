function J = jacob(fun,xk)
h = 1e-5;
n = length(xk);
m = length(fun(xk));
J = zeros(m,n);
for j = 1:n
    hj = zeros(1,n);
    hj(j) = h;
    J(:,j) = (fun(xk+hj)-fun(xk))./h;
end
