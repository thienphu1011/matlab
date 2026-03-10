function print_and_calc(deg)
    rad = sub_calc_radians(deg);
    fprintf('%.2f degrees is equal to %.4f radians.\n', deg, rad);
end

function rad = sub_calc_radians(deg)
    rad = deg * (pi / 180);
end