clear; clc;

x = [1; 2; 3; 4];
h = [3; 2; 1];

[y, H] = conv_tp(h, x);
disp('Matrix H:');
disp(H);
disp('Output y = H*x:');
disp(y);