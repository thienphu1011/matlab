clear; clc; close all;

member1 = 'Thien Phu';
member2 = 'Dinh Hieu';
names_tag = sprintf('(%s, %s)', member1, member2);

bx = [0, 0, 0, 0.25, -0.5, 0.0625];
ax = [1, -1, 0.75, -0.25, 0.0625];

bh = [0, -5/3];
ah = [1, -7/3, 2/3];

by = conv(bx, bh);
ay = conv(ax, ah);

[r, p, k] = residuez(by, ay);
disp('Residues r:');
disp(r);
disp('Poles p:');
disp(p);
disp('Direct terms k:');
disp(k);

n = -10:30;
y_z = zeros(size(n));
for m = 1:length(k)
    y_z = y_z + k(m) * double(n == m - 1);
end

mult = 1;
for i = 1:length(p)
    if i > 1 && abs(p(i) - p(i - 1)) < 1e-6
        mult = mult + 1;
    else
        mult = 1;
    end
    if abs(p(i)) < 1
        if mult == 1
            y_z = y_z + r(i) * (p(i) .^ n) .* double(n >= 0);
        else
            y_z = y_z + r(i) * (n + 1) .* (p(i) .^ n) .* double(n >= 0);
        end
    else
        y_z = y_z - r(i) * (p(i) .^ n) .* double(n <= -1);
    end
end
y_z = real(y_z);

k_idx = 0:100;
xk = (k_idx - 2) .* (0.5 .^ (k_idx - 2)) .* cos(pi * (k_idx - 2) / 3) .* double(k_idx >= 2);
y_direct = zeros(size(n));
for idx = 1:length(n)
    m = n(idx) - k_idx;
    hm = zeros(size(m));
    pos = m >= 0;
    neg = m <= -1;
    hm(pos) = (1/3) .^ m(pos);
    hm(neg) = (1/2) .^ (-m(neg));
    y_direct(idx) = sum(xk .* hm);
end

disp('Max absolute error between Inverse Z-Transform and direct convolution:');
disp(max(abs(y_z - y_direct)));

figure('Name', 'Exercise 4.3 - Inverse Z-Transform', 'Color', 'w');
subplot(2, 1, 1);
stem(n, y_z, 'filled');
title('y(n) via Z-Transform & residuez (ROC: 0.5 < |z| < 2)');
subtitle(names_tag);
xlabel('n'); ylabel('y(n)'); grid on;

subplot(2, 1, 2);
stem(n, y_direct, 'filled');
title('y(n) via Direct Linear Convolution (Verification)');
subtitle(names_tag);
xlabel('n'); ylabel('y(n)'); grid on;