function circle_stats(r)
    area = pi * r^2;
    circumference = 2 * pi * r;
    fprintf('For a circle with radius %.2f:\n', r);
    fprintf('The area is %.2f\n', area);
    fprintf('The circumference is %.2f\n', circumference);
end