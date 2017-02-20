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

printf('\n');

value_c = input("Enter any String\n",'value_s');
printf('%s\n',value_c)
value_c = tolower(value_c);

vallen = length(value_c);

if mod(vallen,3)
  co_no = floor(vallen/3) +1 ;
else
  co_no = floor(vallen/3) ;
end

str_mat = zeros(3,co_no);

wix = 1;

for ix = 1:co_no
  for jx = 1:3
			if wix <= vallen
				str_mat(jx,ix) = stringv_array(find(string_array==value_c(wix)));
				wix += 1;
			end
	 end
end

str_mat;
enc_code = input("Enter any  key String of length 9 \n",'enc_code');
if length(enc_code)!=9 
  disp('InCorrect key Size')
else

  enc_mat = zeros(3,3);

    for jx = 1:9
      enc_mat(jx) = stringv_array(find(string_array==enc_code(jx)));
    end


  enc_mat;
  
  if  det(enc_mat)==0
      disp('InCorrect key')
  else
      enc_det = det(enc_mat);
      enc_det_m_v = int16(mod(enc_det, 29));
      enc_mat*str_mat;
      ans9 = mod(enc_mat*str_mat , 29);

           enc_str = '';

      for inx = 1:vallen
         if ans9(inx) == 0
            break
         else
            char_v = string_array(int16(ans9(inx)));
            enc_str = [enc_str char_v ]; 
          end
           
      end
       disp('Encoded String is:')
       enc_str 

      ans1 = inv(enc_mat)*enc_det;
      det_i = modinverse(enc_det_m_v,29);

      ans2 = det_i*ans1;

      dec_mat = zeros(3,co_no);
      dec_mat = mod(ans2 , 29);
      dec_mat;


      ienc_mat = zeros(3,3);
      ienc_mat = mod(enc_mat*str_mat, 29);
      dec_mat*ienc_mat;

      dec_mat1 = zeros(2,co_no);
      dec_mat1 = mod(dec_mat*ienc_mat, 29);
      %printf("Normal Messge is below:");
      
     % printf("Messge After Decrypting is below:\n");
      %disp(int16(dec_mat1))

      dec_str = '';

      for inx = 1:vallen
         if dec_mat1(inx) == 0
            break
         else
            char_v = string_array(int16(dec_mat1(inx)));
            dec_str = [dec_str char_v ]; 
          end
           
      end
       
       disp('String after Decryption is:')
      dec_str 

      end


end

