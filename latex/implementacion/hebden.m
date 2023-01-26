function lambdak = hebden(phi, Delta, Jk, Dk, funk, Q, Pi, n, m, lambdak, maxit)
ak=lambdak;

Qpi = zeros(n+m, n+m);
Qpi(1:m,1:m)=Q';
Qpi(m+1:end,m+1:end)=Pi';
Jizq = zeros(n+m,n);
Jizq(1:m,1:n) = Jk;
Jizq(m+1:end,1:n) = sqrt(ak)*Dk;

dcha = Qpi*Jizq*Pi;

[W,Ra] = qr(dcha);
W = W';
Ra = Ra(1:n,1:n);

p = @(a) -inv(Jk'*Jk+a*Dk'*Dk)*Jk'*funk;
q = @(a) Dk*p(a);
fac = @(a) (Pi'*Dk'*q(a))/(norm(q(a)));
dphi = @(a) -norm(q(a))*norm(inv(Ra)'*(fac(a)))^2;

uk = norm((Jk*inv(Dk))'*funk)/Delta;
try
    lk = -phi(0)/dphi(0);
catch
    lk = 0;
end
phiak = phi(ak);
k=0;
while abs(phiak)>0.1*Delta && k<maxit
    if ak <= lk || ak >= uk
        ak = max(0.001*uk,sqrt(lk*uk));
    end
    phiak = phi(ak);
    dphiak = dphi(ak);
    if phiak < 0
        uk = ak;
    end
    lk = max(lk, ak-(phiak/dphiak));
    ak = ak-((phiak+Delta)/Delta)*(phiak/dphiak);
    k = k+1;
end
%k
lambdak = ak;
