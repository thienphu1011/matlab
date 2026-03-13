word = input('Enter a MATLAB keyword: ', 's');
while ~iskeyword(word)
    word = input('Error. Please enter a keyword: ', 's');
end
fprintf('%s is a valid keyword.\n', word);