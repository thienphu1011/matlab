clear; clc; close all;

member1 = 'Thien Phu';
member2 = 'Dinh Hieu';
names_tag = sprintf('(%s, %s)', member1, member2);

n = 0:99;
x = double(n >= 30) - double(n >= 50);

h1 = double(n >= 10) - double(n >= 20);
h2 = (0.9 .^ n) .* double(n >= 0);
h3 = double(n == 0) - double(n == 1);

y1 = conv(x, h1);
y2 = conv(x, h2);
y3 = conv(x, h3);

figure('Name', 'Exercise 4.1 - System 1 (y1)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n) = u(n-30) - u(n-50)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h1, 'filled');
title('Impulse Response h1(n) = u(n-10) - u(n-20)');
subtitle(names_tag);
xlabel('n'); ylabel('h1(n)'); grid on;

subplot(3, 1, 3);
stem(n, y1(1:100), 'filled');
title('Output y1(n) = x(n) * h1(n) (First 100 samples)');
subtitle(names_tag);
xlabel('n'); ylabel('y1(n)'); grid on;

figure('Name', 'Exercise 4.1 - System 2 (y2)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n) = u(n-30) - u(n-50)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h2, 'filled');
title('Impulse Response h2(n) = (0.9)^n u(n)');
subtitle(names_tag);
xlabel('n'); ylabel('h2(n)'); grid on;

subplot(3, 1, 3);
stem(n, y2(1:100), 'filled');
title('Output y2(n) = x(n) * h2(n) (First 100 samples)');
subtitle(names_tag);
xlabel('n'); ylabel('y2(n)'); grid on;

figure('Name', 'Exercise 4.1 - System 3 (y3)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n) = u(n-30) - u(n-50)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h3, 'filled');
title('Impulse Response h3(n) = \delta(n) - \delta(n-1)');
subtitle(names_tag);
xlabel('n'); ylabel('h3(n)'); grid on;

subplot(3, 1, 3);
stem(n, y3(1:100), 'filled');
title('Output y3(n) = x(n) * h3(n) (First 100 samples)');
subtitle(names_tag);
xlabel('n'); ylabel('y3(n)'); grid on;