% SCRIPT: carnot.m
Tc = input('Enter the temperature of the cold reservoir (in Kelvin): ');
Th = input('Enter the temperature of the hot reservoir (in Kelvin): ');

if Tc >= Th
    fprintf('Error: The cold reservoir temperature must be lower than the hot reservoir.\n');
elseif Tc < 0 || Th < 0
    fprintf('Error: Absolute temperatures cannot be below 0 Kelvin.\n');
else
    efficiency = calc_carnot(Tc, Th);
    fprintf('The maximum Carnot efficiency is: %.3f\n', efficiency);
end

function eta = calc_carnot(Tc, Th)
    eta = 1 - (Tc / Th);
end