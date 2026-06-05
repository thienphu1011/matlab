while true
score = input('Enter the score: ');
if score <=4 && score >0
	disp('You have failed');
elseif score <=7 && score>=5
	disp('You have passed');
elseif score =10 && score >=8
	disp('You have achieved excellence');
else 
	disp('Invalid score entered');
end
end

