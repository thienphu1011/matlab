function writeTempChart_20(minF, maxF)
    filename = 'temperature.txt';
    fid = fopen(filename, 'w');
    
    fprintf(fid, 'TEMPERATURE CONVERSION CHART\n');
    fprintf(fid, 'Fahrenheit\tCelsius\n');
    fprintf(fid, '----------\t-------\n');
    
    for F = minF:maxF
        C = (F - 32) * 5/9;
        fprintf(fid, '%.1f\t\t%.2f\n', F, C);
    end
    
    fclose(fid);
end