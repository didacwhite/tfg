clear all
rng default % para que sea reproducible
d = linspace(0,3);
y = exp(-1.3*d) + 0.05*randn(size(d));
fun = @(r)exp(-d*r)-y;
x0 = 4;
tic
x = myLevMar(fun,x0);
toc
options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt');
tic
x = lsqnonlin(fun,x0,[],[],options);
toc