while true 
num=input('Enter the number :');
if floor(num)~=num
	disp('This is decimal number .Not have even or odd ability');
	disp('Enter the integer number');
	else 
	break;
end 
end 
if mod(num,2)==0 
	disp('The number is even');
if num>0 
	disp('The number is positive');
	elseif num<0
	disp('The number is negative');
	else 
	disp('The number is zero');
end 
else 
	disp('The number is odd');
	if num>0 
	disp('The number is positive');
	elseif num<0
	disp('The number is negative');
	else 
	disp('The number is zero');

end 
end


