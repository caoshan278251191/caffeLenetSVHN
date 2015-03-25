function [valide,value,score]=lenet(im) 
% convert from uint8 to single
%   im =imread('im.jpg');
  % reshape to ( 28x28)
  score=0;
 % im=flipud(rot90(im));
  im = imresize(im, [28 28], 'bilinear');
 
  im=normalize(im);
  matcaffe_init(1);
 % tic;
  input_data = {im};
  %toc;
  %tic;
  scores = caffe('forward', input_data);
  %toc;
  nums=zeros(1,10);
  nums =[scores{:,1,1}];
  if max(nums)>=0.9    
    valide=1;
  else
    valide=0;  
  end
  
  a=zeros(1,1,10);
  a(1,1,1:10)=scores{1,1};
  for i=1:10
      if a(1,1,i)==max(a(1,1,:))
          value=i-1;
          score=a(1,1,i);
          break; % once get the correct value, jump out the loop.
      else
      value=11;
      end
          
  end

 