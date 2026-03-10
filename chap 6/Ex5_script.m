user_input = input('Enter an angle in decimal degrees (DD): ', 's');
dd_angle = str2double(user_input);

if isnan(dd_angle)
    error('Invalid input. Please enter a numeric angle.');
else
    
    [deg, min, sec] = convertDDtoDMS(dd_angle);
    fprintf('The angle %.4f° DD is equivalent to %d° %d'' %.2f" in DMS form.\n', dd_angle, deg, min, sec);
end