%rng default;
d = linspace(0,10);
beta = 3;
eta = 5;
y = weibull(d,beta,eta) + 0.005*randn(size(d));

fun = @(r) weibull(d,r(1),r(2)) - y;

x0 = [1,2];
xk = myLevMar(fun,x0);

[x,resnorm,residual,exitflag,output] = levman(fun,x0);

%plot(d,y,'ro',d,weibull(d,beta,eta),'b:',d,fun(x)+y, 'r-')