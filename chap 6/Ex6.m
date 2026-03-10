fprintf( 1, 'The result is %.1f\n', doit(4,11) )

%Invalid. The function header function doit(a, b) does not declare an output argument (it would need to look like function out = doit(a, b)). Because doit returns nothing, it cannot be passed as an argument to fprintf.

doit(5, 2, 11.11)

%Invalid. The function is defined to accept exactly two input arguments (a and b), but this call attempts to pass three. This will result in a "Too many input arguments" error.

x = 11; y = 3.3; doit(x,y)

%Valid. The function expects two inputs, and two valid numeric variables (x and y) are passed to it.