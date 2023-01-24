function [x,resnorm,residual,exitflag,output] = levman(fun, x0)

options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt','Display','iter');
[x,resnorm,residual,exitflag,output] = lsqnonlin(fun,x0,[],[],options);