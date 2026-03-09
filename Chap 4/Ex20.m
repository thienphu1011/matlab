clc
clear
num = randi([1 100]);
fprintf('Generated number: %d\n',num)
if mod(num,2) == 0
    disp('The number is even')
else
    disp('The number is odd')
end