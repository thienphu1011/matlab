
clear; clc;

Fs = 8000;
samples_per_count = 4000;
overlap = 800;          

notes =     {'A', 'A', 'E', 'E', 'E', 'B', 'C', 'B', 'A', 'R', ...
             'E', 'G', 'A4', 'G', 'E', 'F#', 'D', 'E'};
durations = [ 2,   1,   1,   1,   1,   1,   1,   1,   3,   1,  ...
              1,   1,   2,    1,   1,   1,    1,   3 ];

note_lengths = round(durations * samples_per_count);
total_len = sum(note_lengths) - (length(notes) - 1) * overlap;
song = zeros(1, total_len);

idx = 1;
for i = 1:length(notes)
    f = get_freq(notes{i});
    N = note_lengths(i);
    t = (0:N-1) / Fs;
    
    if f == 0
        tone = zeros(1, N);
    else
        tone = sin(2 * pi * f * t) .* make_adsr(N);
    end
    
    
    song(idx : idx + N - 1) = song(idx : idx + N - 1) + tone;
    
    
    idx = idx + N - overlap;
end


song = song / max(abs(song));

sound(song, Fs);

figure;
plot((0:length(song)-1)/Fs, song);
xlabel('Time (s)'); ylabel('Normalized Amplitude');
title('Part 5.3: ADSR + Overlapped Tones (Scarborough Fair)');


function env = make_adsr(N)
    nA = round(0.10 * N);
    nD = round(0.15 * N);
    nR = round(0.25 * N);
    nS = N - nA - nD - nR;
    
    env = [linspace(0, 1, nA), ...
           linspace(1, 0.8, nD), ...
           0.8 * ones(1, nS), ...
           linspace(0.8, 0, nR)];
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