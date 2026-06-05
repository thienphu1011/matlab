while true
n=input('Enter dimension of matrix :');
if floor(n)==n && n>=0
	break;
	else 
	disp('Invalid input , the dimension must be positive and integer number');
	end 
end 
	
M=zeros(n,n);
for i=1:n
	for j=1:n
	if mod (i+j,2)==0
		M(i,j)=1;
		else 
		M(i,j)=0;
	end 
end 
end
disp(M);
		




