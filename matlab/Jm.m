function Jm = Jmfun(Pi,T,Q)
Tm1 = zeros(m,m);
Tm1(1:n,1:n)=inv(T);
Jm = Pi*Tm1*Q';
