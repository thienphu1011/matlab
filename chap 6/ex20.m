explainProgram();
[minTemp, maxTemp] = getTemperatures();
writeTempsToFile(minTemp, maxTemp, 'temperature_chart.txt');

function explainProgram()
    fprintf('--- Temperature Conversion Program ---\n');
    fprintf('This program will ask you for a minimum and maximum\n');
    fprintf('temperature in Fahrenheit. It will then generate a\n');
    fprintf('conversion chart to Celsius and save it to a file.\n\n');
end

function [minF, maxF] = getTemperatures()
    minF = input('Enter the minimum temperature (F): ');
    maxF = input('Enter the maximum temperature (F): ');
    
    if minF > maxF
        fprintf('Minimum is greater than maximum. Swapping values\n');
        [minF, maxF] = swapValues(minF, maxF);
    end

    function [val1, val2] = swapValues(v1, v2)
        val1 = v2;
        val2 = v1;
    end
end

function writeTempsToFile(minF, maxF, filename)
    fileID = fopen(filename, 'w');
    if fileID == -1
        error('Could not open file for writing.');
    end

    fprintf(fileID, 'Fahrenheit(F)   Celsius(C)\n');
    fprintf(fileID, '--------------------------\n');

    for f = minF:maxF
        c = (f - 32) * 5/9;
        fprintf(fileID, '%10.2f %13.2f\n', f, c);
    end
    
    fclose(fileID);
    fprintf('\nSuccess! Temperature chart written to %s\n', filename);
end