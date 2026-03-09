clc
clear
disp('1 - Circle')
disp('2 - Rectangle')
disp('3 - Triangle')
choice = input('Choose a shape: ');
switch choice
    case 1
        r = input('Enter radius: ');
        area = pi * r^2;
        
    case 2
        l = input('Enter length: ');
        w = input('Enter width: ');
        area = l * w;
        
    case 3
        b = input('Enter base: ');
        h = input('Enter height: ');
        area = 0.5 * b * h;
        
    otherwise
        disp('Invalid choice')
        area = [];
end
if ~isempty(area)
    fprintf('Area = %.2f\n', area)
end