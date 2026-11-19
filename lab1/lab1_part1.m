
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
        tone = sin(2 * pi * f * t);
    end
    
   
    song = [song, tone, short_pause];
end


sound(song, Fs);


figure;
plot((0:length(song)-1)/Fs, song);
xlabel('Time (s)'); ylabel('Amplitude');
title('Part 5.1: Basic Music Synthesis (Scarborough Fair)');


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