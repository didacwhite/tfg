function xk = myLevMar(fun, x0)
% setup
[n,m,xk,Delta,funk,lambdak, maxit, maxit2]= myLevMarSetup(fun,x0);

% calculo inicial de Jk y Dk
dkm1=zeros(length(xk));
[Jk, Dk, dkm1] = JDk(fun,xk,dkm1);

for i = 1:maxit
    % solución problema lineal
    % descomposicion QR
    [Q,R,Pi] = qr(Jk); % calcula Jk*Pi = Q*R
    % ajuste de R
    T = R(1:n,1:n);
    S = R(1:n,n+1:end);
    
    % matriz $J^{-}$
    Jm = Jmfun(Pi,T,Q,n,m);
    
    % parámetro levenberg-marquardt
    [pk, lambdak] = pkfun(Delta, Jk, Dk, funk, Jm, Q, Pi, R, n, m, lambdak, maxit2);
    
    % 2. calculo de rho
    rho = rhofun(funk,pk,lambdak,Dk,Jk,fun, xk);
    
    % actualizacion de xk
    if rho <= 0.0001
        % xk+1 = xk y jk+1=jk
        % continue
    else
        xk = xk+pk;
        % calculo de Jk, Dk con el nuevo xk
        funk = fun(xk)';
        [Jk, Dk, dkm1] = JDk(fun,xk,dkm1);
    end

    % actualizacion de Delta
    if rho <= 0.25
        Delta = Delta/2;
    elseif rho >= 0.75
        Delta = 2*norm(Dk*pk');
    elseif lambdak == 0
        Delta = 2*norm(Dk*pk');
    end
    
end


