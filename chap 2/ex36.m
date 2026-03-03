A = [15 8 42 23 4; 9 12 5 38 17; 21 34 11 2 29]
max_in_cols = max(A)
max_in_rows = max(A, [], 2)
max_overall = max(A(:))
cumulative_maxmima = cummax(A)