function s = modinversea(a,m)
%Mod_Inverse 

pr_fac =[];
for n=2:floor(m/2)
	if  mod(m,n)==0 
		pr_fac = [pr_fac n];
	end
end	
	
modv_len = length(a);
s = zeros(1,modv_len);

for ix = 1:modv_len
	if a(ix)>=m 
		s(ix) = 0;
		%printf('%d greater than Range\n')
	elseif find(pr_fac==a(ix)) || find(mod(a(ix),pr_fac)==0)  
		%printf('%d is multiple of Prime factor of %d\n',a,m)
		s(ix) =0 ;
	else
		for iz = 0:m-1
			 if mod(a(ix)*iz,m)==1
				 s(ix)= iz;
			end
		 end
	end

end