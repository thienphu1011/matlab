% 1. round(x) is equivalent to floor(x) when the fractional part rounds down.
x1 = 2.4;
test_floor = (round(x1) == floor(x1)) % Result: 1 (True, both equal 2)

% round(x) is equivalent to ceil(x) when the fractional part rounds up.
x2 = 2.5;
test_ceil = (round(x2) == ceil(x2))   % Result: 1 (True, both equal 3)