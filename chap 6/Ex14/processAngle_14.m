function processAngle_14(deg)
    rad = deg2rad(deg);  
    fprintf('%.2f degrees = %.4f radians\n', deg, rad);
    function rad = deg2rad(deg)
        rad = deg * pi / 180;
    end
end