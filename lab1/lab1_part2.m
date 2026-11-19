
clear; clc;

Fs = 8000;
samples_per_count = 4000;
pause_len = 400;

notes =     {'A', 'A', 'E', 'E', 'E', 'B', 'C', 'B', 'A', 'R', ...
             'E', 'G', 'A4', 'G', 'E', 'F#', 'D', 'E'};
durations = [ 2,   1,   1,   1,   1,   1,   1,   1,   3,   1,  ...
              1,   1,   2,    1,   1,   1,    1,   3 ];

song = [];
short_pause = zeros(1, pause_len);

for i = 1:length(notes)
    f = get_freq(notes{i});
    N = round(durations(i) * samples_per_count);
    t = (0:N-1) / Fs;
    
    if f == 0
        tone = zeros(1, N);
    else
        env = make_adsr(N);                 
        tone = sin(2 * pi * f * t) .* env;  
    end
    
    song = [song, tone, short_pause];
end

sound(song, Fs);


figure;
subplot(2,1,1);
plot(make_adsr(samples_per_count), 'LineWidth', 1.5);
title('ADSR Windowing Function (1 Count = 4000 Samples)');
xlabel('Samples'); ylabel('Gain'); ylim([0 1.1]); grid on;

subplot(2,1,2);
t1 = (0:samples_per_count-1)/Fs;
plot(t1, sin(2*pi*220*t1) .* make_adsr(samples_per_count));
title('Note A (220 Hz) Shaped by ADSR Envelope');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;


function env = make_adsr(N)
   
    nA = round(0.10 * N);      
    nD = round(0.15 * N);      
    nR = round(0.25 * N);       
    nS = N - nA - nD - nR;     
    
    A = linspace(0, 1, nA);       
    D = linspace(1, 0.8, nD);      
    S = 0.8 * ones(1, nS);          
    R = linspace(0.8, 0, nR);       
    
    env = [A, D, S, R];
end

function f = get_freq(note)
    switch upper(note)
        case 'A',              k = 0;
        case {'A#', 'BB'},     k = 1;
        case 'B',              k = 2;
        case 'C',              k = 3;
        case {'C#', 'DB'},     k = 4;
        case 'D',              k = 5;
        case {'D#', 'EB'},     k = 6;
        case 'E',              k = 7;
        case 'F',              k = 8;
        case {'F#', 'GB'},     k = 9;
        case 'G',              k = 10;
        case {'G#', 'AB'},     k = 11;
        case 'A4',             k = 12;
        case 'R',              f = 0; return;
        otherwise,             error('Unknown note: %s', note);
    end
    f = 220 * 2^(k / 12);
end