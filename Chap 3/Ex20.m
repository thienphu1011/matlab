M1 = randi([50, 100], 3, 6);
save('randfile.dat', 'M1', '-ascii');
M2 = randi([50, 100], 2, 6);
save('randfile.dat', 'M2', '-ascii', '-append');
randfile = load('randfile.dat')