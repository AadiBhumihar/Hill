clear;
clc;

string_array = zeros(1,29);
stringv_array = zeros(1,29);
s_val = 97;

for ix = 1 :29

  if ix<=26
   
     string_array(ix) = s_val;
     stringv_array(ix) = ix;
     s_val += 1;
     
  elseif ix == 27
      string_array(ix) = 32;
      stringv_array(ix) = ix;
      
   elseif ix == 28
      string_array(ix) = 44;
      stringv_array(ix) = ix;
      
   elseif ix == 29
      string_array(ix) = 46;
      stringv_array(ix) = ix;
      
   end
   
end


string_array = char(string_array);

for ix = 1:29
 # printf('[%2c]',string_array(ix))
end

printf('\n');

for ix = 1:29
 # printf('[%2d]',stringv_array(ix))
end

printf('\n');

value_c = 'aditya raj';%input("Enter any String\n",'value_s');
printf('%s\n',value_c)

vallen = length(value_c)

if mod(vallen,2)
  co_no = floor(vallen/2) +1
else
  co_no = floor(vallen/2) 
end

str_mat = zeros(2,co_no);

wix = 1;

for ix = 1:co_no
  for jx = 1:2
			if wix <= vallen
				str_mat(jx,ix) = stringv_array(find(string_array==value_c(wix)));
				wix += 1;
			end
	 end
end

str_mat
enc_code = 'adsg'
enc_mat = zeros(2,2);

	for jx = 1:4
		enc_mat(jx) = stringv_array(find(string_array==enc_code(jx)));
	end


enc_mat
enc_det = det(enc_mat)
enc_det_m = mod(enc_det, 29)
enc_mat*str_mat

%%%% Decrypting %%%%


ans1 = inv(enc_mat)*enc_det;
det_i = modinverse(enc_det_m,29);

ans2 = det_i*ans1;

dec_mat = zeros(2,co_no);
dec_mat = mod(ans2 , 29);
dec_mat;


ienc_mat = zeros(3,3);
ienc_mat = mod(enc_mat*str_mat, 29)
dec_mat*ienc_mat;

dec_mat1 = zeros(2,co_no);
dec_mat1 = mod(dec_mat*ienc_mat, 29);

printf("Normal Messge is below:");
str_mat
printf("Messge After Decrypting is below:\n");
disp(dec_mat1)