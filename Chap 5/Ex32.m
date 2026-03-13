% 1. Sum the integers 1 through 50:
% Choice: FOR loop
% Reason: The number of iterations is fixed (50 times).

% 2. Add 3 to all numbers in a vector:
% Choice: NO loop
% Reason: MATLAB is optimized for vectorization (e.g., v + 3).
% 3. Prompt the user for a string until it is a MATLAB keyword:

% Choice: WHILE loop
% Reason: The number of attempts depends on the user's input.

% 4. Find the minimum in every column of a matrix:
% Choice: FOR loop
% Reason: To iterate through each column index. (Or no loop using min(mat)).

% 5. Prompt the user for 5 numbers and find their sum:
% Choice: FOR loop
% Reason: The number of prompts is pre-determined (5).

% 6. Prompt for 10 numbers, find average and count numbers > average:
% Choice: FOR loop
% Reason: The number of inputs is fixed at 10.

% 7. Generate random n, prompt for n positive numbers with error-checking:
% Choice: NESTED loop (a WHILE loop inside a FOR loop)
% Reason: The FOR loop runs n times; the WHILE loop ensures each input is positive.

% 8. Prompt for positive numbers until a negative is entered:
% Choice: WHILE loop
% Reason: The loop terminates based on a condition, not a count.