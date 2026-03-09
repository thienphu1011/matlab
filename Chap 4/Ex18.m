clc
clear
letter = input('Enter your answer (y/n): ','s');
switch letter
    case {'y','Y'}
        disp('OK, continuing')
    case {'n','N'}
        disp('OK, halting')
    otherwise
        disp('Error')
end