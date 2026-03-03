q1 = ('b' >= 'c')        % Result: 0 (False, 98 is not >= 99)
q2 = (1 - 3 == 2 + 1)    % Result: 0 (False)
q3 = ((3 == 2) + 1)      % Result: 1
q4 = xor(5 < 6, 8 > 4)   % Result: 0 (False)
q5 = (10 > 5 > 2)        % Result: 0 (False)
result = 3^2 - 20;       % result is -11
q6 = (0 <= result <= 10) % Result: 1 (True)