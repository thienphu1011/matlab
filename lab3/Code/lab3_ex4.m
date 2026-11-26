clear; clc; close all;

member1 = 'Thien Phu';
member2 = 'Dinh Hieu';
names_tag = sprintf('(%s, %s)', member1, member2);

n = 0:99;
x = double(n >= 30) - double(n >= 50);

h1 = double(n >= 10) - double(n >= 20);
h2 = (0.9 .^ n) .* double(n >= 0);
h3 = double(n == 0) - double(n == 1);

Nx = length(x);
Nh = length(h1);
Ny = Nx + Nh - 1;

x_pad = [x, zeros(1, Nh - 1)];
h1_pad = [h1, zeros(1, Nx - 1)];
h2_pad = [h2, zeros(1, Nx - 1)];
h3_pad = [h3, zeros(1, Nx - 1)];

y1_fft = real(ifft(fft(x_pad, Ny) .* fft(h1_pad, Ny)));
y2_fft = real(ifft(fft(x_pad, Ny) .* fft(h2_pad, Ny)));
y3_fft = real(ifft(fft(x_pad, Ny) .* fft(h3_pad, Ny)));

y1_conv = conv(x, h1);
y2_conv = conv(x, h2);
y3_conv = conv(x, h3);

disp('Max absolute difference for h1:');
disp(max(abs(y1_fft - y1_conv)));
disp('Max absolute difference for h2:');
disp(max(abs(y2_fft - y2_conv)));
disp('Max absolute difference for h3:');
disp(max(abs(y3_fft - y3_conv)));

figure('Name', 'Exercise 4.4 - System 1 (FFT)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h1, 'filled');
title('Impulse Response h1(n)');
subtitle(names_tag);
xlabel('n'); ylabel('h1(n)'); grid on;

subplot(3, 1, 3);
stem(n, y1_fft(1:100), 'filled');
title('Output y1(n) via Circular Convolution (FFT/IFFT)');
subtitle(names_tag);
xlabel('n'); ylabel('y1(n)'); grid on;

figure('Name', 'Exercise 4.4 - System 2 (FFT)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h2, 'filled');
title('Impulse Response h2(n)');
subtitle(names_tag);
xlabel('n'); ylabel('h2(n)'); grid on;

subplot(3, 1, 3);
stem(n, y2_fft(1:100), 'filled');
title('Output y2(n) via Circular Convolution (FFT/IFFT)');
subtitle(names_tag);
xlabel('n'); ylabel('y2(n)'); grid on;

figure('Name', 'Exercise 4.4 - System 3 (FFT)', 'Color', 'w');
subplot(3, 1, 1);
stem(n, x, 'filled');
title('Input x(n)');
subtitle(names_tag);
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3, 1, 2);
stem(n, h3, 'filled');
title('Impulse Response h3(n)');
subtitle(names_tag);
xlabel('n'); ylabel('h3(n)'); grid on;

subplot(3, 1, 3);
stem(n, y3_fft(1:100), 'filled');
title('Output y3(n) via Circular Convolution (FFT/IFFT)');
subtitle(names_tag);
xlabel('n'); ylabel('y3(n)'); grid on;