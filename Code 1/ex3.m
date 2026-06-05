n= input('Enter a positive integer n; ');
if n>0 && floor(n)==n 
	total_sum=0;
	for i=1:n
		total_sum =total_sum+i;
	end
	disp(['The sum from 1 to ',num2str(n),' is ', num2str(total_sum)]);
	else 
	disp('Invalid input. Please enter a positive integer');
end 


