
% Song: "We Don't Talk Anymore" (Chorus Hook - 24 notes)
clear; clc;

Fs = 8000;                  
samples_per_count = 4000;   
overlap = 300;             

% Melody:
% Line 1: We don't talk a-ny-more (rest)
% Line 2: We don't talk a-ny-more (rest)
% Line 3: We don't talk a-ny-more (rest)
% Line 4: Like we used to do
notes = { ...
    'F#', 'G#', 'G#', 'F#', 'E', 'C#', 'R', ...
    'F#', 'G#', 'G#', 'F#', 'E', 'D#', 'R', ...
    'F#', 'G#', 'G#', 'F#', 'E', 'C#', 'R', ...
    'C#', 'D#', 'E',  'B4', 'G#', 'F#' };

durations = [ ...
    0.25, 0.50, 0.50, 0.25, 0.50, 1.50, 0.50, ...
    0.25, 0.50, 0.50, 0.25, 0.50, 1.50, 0.50, ...
    0.25, 0.50, 0.50, 0.25, 0.50, 1.50, 0.50, ...
    0.50, 0.50, 0.50, 0.50, 0.50, 1.50 ];

note_lengths = round(durations * samples_per_count);
total_len = sum(note_lengths) - (length(notes) - 1) * overlap;
song = zeros(total_len, 1);

idx = 1;
for i = 1:length(notes)
    f = get_freq(notes{i});
    N = note_lengths(i);
    t = (0:N-1).' / Fs;
    
    if f == 0
        tone = zeros(N, 1);
    else
        tone = sin(2 * pi * f * t) .* make_adsr(N);
    end
    
  
    song(idx : idx + N - 1) = song(idx : idx + N - 1) + tone;
    idx = idx + N - overlap;
end


song = 0.95 * song / max(abs(song));


sound(song, Fs);


output_file = 'we_dont_talk_anymore.wav';
audiowrite(output_file, song, Fs);
fprintf('Saved synthesized audio to %s\n', output_file);


figure;
plot((0:length(song)-1)/Fs, song);
xlabel('Time (s)');
ylabel('Normalized Amplitude');
title('Part 5.4: "We Don''t Talk Anymore" (ADSR + Overlapped Tones)');
grid on;


function env = make_adsr(N)
    nA = round(0.10 * N);       
    nD = round(0.15 * N);       
    nR = round(0.25 * N);      
    nS = N - nA - nD - nR;     
    
    env = [linspace(0, 1, nA), ...
           linspace(1, 0.8, nD), ...
           0.8 * ones(1, nS), ...
           linspace(0.8, 0, nR)].';
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
        case {'A#4', 'BB4'},   k = 13;
        case 'B4',             k = 14;
        case 'R',              f = 0; return;
        otherwise,             error('Unknown note: %s', note);
    end
    f = 220 * 2^(k / 12);
end