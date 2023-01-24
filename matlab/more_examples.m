options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt','Display','iter');
% fletcher powell

d = linspace(-2,2);
fun = @(x) [10*(x(3)-10*t(x(1),x(2))),10*((x(1)^2+x(2)^2)^(1/2)-1),x(3)];
%fun = @(x) [2*x(1), x(1)*x(2), x(3)];
x0=[-1,0,0];
x=myLevMar(fun,x0)

%[x,resnorm,residual,exitflag,output] = lsqnonlin(fun,x0,[],[],options);
