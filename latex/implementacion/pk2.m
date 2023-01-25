function pk = pk2(funk, Q, Pi, R, Jk, Dk, lambdak, n, m)
Qpi = zeros(n+m, n+m);
Qpi(1:m,1:m)=Q';
Qpi(m+1:end,m+1:end)=Pi';
Jizq = zeros(n+m,n);
Jizq(1:m,1:n) = Jk;
Jizq(m+1:end,1:n) = sqrt(lambdak)*Dk;

dcha = Qpi*Jizq*Pi;

[W,Rlambda] = qr(dcha);
W = W';
Rlambda = Rlambda(1:n,1:n);
Qf0 = zeros(1,size(W,1));
Qfunk = Q'*funk;

Qf0(1:length(Qfunk)) = Qfunk;

uv= W*Qf0';
u = uv(1:n);
pk = -Pi*inv(Rlambda)*u;
pk = pk';