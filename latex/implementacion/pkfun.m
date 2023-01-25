function [pk, lambdak] = pkfun(Delta, Jk, Dk, funk, Jm, Q, Pi, R, n, m, lambdak, maxit)

phi = @(a) norm(Dk*inv(Jk'*Jk+a.*(Dk'*Dk))*Jk'*funk) - Delta;
if phi(0) == 0
    lambdak = 0;
    pk = -Jm*funk;
    pk = pk';
else
    lambdak = hebden(phi, Delta, Jk, Dk, funk, Q, Pi, R, n, m, lambdak, maxit);
    pk = pk2(funk, Q, Pi, R, Jk, Dk, lambdak, n, m);
end