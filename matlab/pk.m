function [pk, lambdak] = pk(Delta, Jk, Dk, funk, Jm, Q, Pi, R, n, m)

phi = @(a) norm(Dk*inv(Jk'*Jk+a*(Dk'*Dk))*J'*funk) - Delta;

if phi(0) == 0
    lambdak = 0;
    pk = -Jm*funk;
else
    lambdak = fminsearch(phi,1);
    pk = pk2(Q, Pi, R, Jk, Dk, lambdak, n, m);
end