n = randi(4);
for i = 1:n
    circ = input('Enter the circumference of the circle: ');
    [rad, area] = radarea_18(circ);
    dispra_18(rad,area)
end