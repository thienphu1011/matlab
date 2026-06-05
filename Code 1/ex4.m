M=zeros (4,4);
for i=1:4
  for j=1:4
  	M(i,j)=i+j;
  	end 
end 
disp('The generated matrix is:');
disp(M);
