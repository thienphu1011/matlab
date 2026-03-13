function plotAmount_16(years)
P = 10000;
i = 0.05;
n = 1:years;
S = P*(1+i).^n;
plot(n,S)
xlabel('Years')
ylabel('Amount ($)')
title('Compound Interest Growth')

end