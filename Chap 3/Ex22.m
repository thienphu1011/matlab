M = [-0.5, 1.2, 2.8; 
      0.1, -0.9, 1.5];

save('testtan.dat', 'M', '-ascii');
loaded_matrix = load('testtan.dat');
tan_matrix = tan(loaded_matrix)