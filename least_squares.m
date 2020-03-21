x = [-2 -1 0 1 2 3 4 4.5];
y = [12 4.5 1.5 0 0 2.8 8.4 10.8];

A = ones(size(x));
A = [A; x; x.^2];

A_prime = A*A';

b_prime = A*y';

R = chol(A_prime);
L = R';

lowtraing = dsp.LowerTriangularSolver;
uptriang = dsp.UpperTriangularSolver;
z = lowtraing(L, b_prime);
coeff = uptriang(R, z);

figure()
scatter(x,y);
hold on;
x0 = linspace(-5,5,100);
y0 = coeff(1) + coeff(2)*x0 + coeff(3)*x0.^2;
plot(x0,y0);
xlim([-4,6]);
ylim([-1,15]);
