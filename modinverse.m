function s = modinverse(a,m)
%Mod_Inverse 

pr_fac =[];
for n=2:floor(m/2)
	if  mod(m,n)==0 
		pr_fac = [pr_fac n];
	end
end	
	
	
if a>=m
	printf('%d greater than Range\n')
elseif find(pr_fac==a) || find(mod(a,pr_fac)==0)
	printf('%d is multiple of Prime factor of %d\n',a,m)
else
	for ix = 0:m-1
		 if mod(a*ix,m)==1
		   s= ix;
		end
   end
end

