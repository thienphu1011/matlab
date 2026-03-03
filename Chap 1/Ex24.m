
B = int16(5);           % B is an integer type (int16)
A = 10.5;               % A is a floating-point type (double)
C = cast(A, 'like', B)  % C becomes an int16, just like B (value becomes 11)