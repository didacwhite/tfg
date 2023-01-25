function rho = rhofun(funk,pk,lambdak,Dk,Jk,fun,xk)
funplus = fun(xk+pk);

rhonum=1-(norm(funplus)/norm(funk))^2;
rhoden=(norm(Jk*pk')/norm(funk))^2+2*(sqrt(lambdak)*norm(Dk*pk')/norm(funk))^2;
rho = rhonum/rhoden;