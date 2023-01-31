clear all
d = linspace(-2,2);
fun = @(x) [10*(x(3)-10*theta(x(1),x(2))),10*((x(1)^2+x(2)^2)^(1/2)-1),x(3)];
x0 = [-1,0,0];
tic
[x,k] = myLevMar(fun,x0)
toc
options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt');
tic
[x,resnorm,residual,exitflag,output] = lsqnonlin(fun,x0,[],[],options);
toc
output