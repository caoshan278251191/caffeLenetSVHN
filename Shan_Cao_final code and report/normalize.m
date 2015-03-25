function output= normalize(input) 
 im=single(input);
 max_im=max(max(im));
  min_im=min(min(im));
  for i=1:1:size(im,2)
      for j=1:1:size(im,1)
          im(j,i)=((im(j,i)-min_im)/(max_im-min_im))*256;
      end
  end
  output=im;