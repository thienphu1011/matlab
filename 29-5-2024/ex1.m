while true
n=input('Enter a positive even number :');
if mod(n,2)==0 && n>=0 && floor(n)==n
	f=1;
	for i=1:n
		f=f*i;
	end
	disp(['The factorial is: ',num2str(f)]);
	else 
	disp('Invalid input. The number must be positive and even');
	end 
end

