t = linspace(0,5);
d = 5*rand(20,1);
y = 1.18*d + 0.8 + 0.5*randn(size(d));
plot(d,y,'bx', t,1.18*t + 0.8,'r-',[d(13),d(13)],[y(13),1.18*d(13) + 0.8],'g-')
%plot(d,y,'ko',d,exp(-x*d),'b-',d,exp(-4*d),'r:',d,exp(-3*d),'r:',d,exp(-2*d),'r:')
legend('Datos','Mejor ajuste')
xlabel('t')
ylabel('y')