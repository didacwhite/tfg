function f = weibull(t, beta, eta)
f = ((beta.*t.^(beta-1))./(eta.^beta)).*exp(-t./eta).^beta;