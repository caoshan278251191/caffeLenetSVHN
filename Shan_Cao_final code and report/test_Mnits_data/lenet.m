function output=lenet(im) 
% convert from uint8 to single
%   im =imread('im.jpg');
  % reshape to ( 28x28)
%   im=flipud(rot90(im));
  im = imresize(im, [28 28], 'bilinear');
  im=single(im);
  max_im=max(max(im));
  min_im=min(min(im));
  for i=1:1:size(im,2)
      for j=1:1:size(im,1)
          im(j,i)=((im(j,i)-min_im)/(max_im-min_im))*256;
      end
  end
  matcaffe_init(1);
  tic;
  input_data = {im};
  toc;
  tic;
  layers = caffe('get_weights');
  scores = caffe('forward', input_data);
  toc;
  nums=zeros(1,10);
  nums =[scores{:,1,1}];
  a=zeros(1,1,10);
  a(1,1,1:10)=scores{1,1};

  for i=1:10
      if a(1,1,i)==max(a(1,1,:))
          output=i-1;
      end
          
  end
