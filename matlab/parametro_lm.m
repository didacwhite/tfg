function lambda = pk(Delta, Jk, Dk, funk)

phi = @(a) norm(Dk*inv(Jk'*Jk+a*(Dk'*Dk))*J'*funk) - Delta;

if phi(0) == 0
    lambda = 0;
else
    lambda = fminsearch(phi,1);
end