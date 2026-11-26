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
y = zeros(size(n));
for m = 1:length(k)
    y = y + k(m) * double(n == m - 1);
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
            y = y + r(i) * (p(i) .^ n) .* double(n >= 0);
        else
            y = y + r(i) * (n + 1) .* (p(i) .^ n) .* double(n >= 0);
        end
    else
        y = y - r(i) * (p(i) .^ n) .* double(n <= -1);
    end
end
y = real(y);

figure('Name', 'Exercise 4.3 - Inverse Z-Transform', 'Color', 'w');
stem(n, y, 'filled');
title('y(n) = x(n) * h(n) via Z-Transform & residuez');
subtitle(names_tag);
xlabel('n'); ylabel('y(n)'); grid on;