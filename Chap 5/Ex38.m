temps = -10:5:10; 
speeds = 5:5:20;
wcf_mat = zeros(length(temps), length(speeds));
for r = 1:length(temps)
    for c = 1:length(speeds)
        T = temps(r); V = speeds(c);
        wcf_mat(r,c) = 35.74 + 0.6215*T - 35.75*(V^0.16) + 0.4275*T*(V^0.16);
    end
end
save wcf_data.dat wcf_mat -ascii