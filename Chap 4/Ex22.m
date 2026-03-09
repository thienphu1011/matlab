clc
clear
ranforce = randi([0 12]);
fprintf('Wind force: %d\n',ranforce)
if ranforce == 0
    disp('There is no wind')

elseif ranforce >= 1 && ranforce <= 6
    disp('There is a breeze')

elseif ranforce >= 7 && ranforce <= 9
    disp('This is a gale')

elseif ranforce == 10 || ranforce == 11
    disp('It is a storm')

elseif ranforce == 12
    disp('Hello, Hurricane!')
end