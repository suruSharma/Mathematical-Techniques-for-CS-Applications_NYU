X = [-1:0.001:1]';

F = tanh(2*X);

L = legendre(5,X);

C = L*F;

approx = pinv(L)*C;

plot(approx,'b');

hold

plot(F,'r');
