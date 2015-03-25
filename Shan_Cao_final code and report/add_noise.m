clc;clear;close all;
load mnist_all.mat
j=0;
for i=1:1:100
index=double(randi(size(test6,1),1));
a=single(test6(index,:));
J=reshape(a,28,28);
 imshow(J);
J = imnoise(J,'gaussian',100,10) ;
J=normalize(J);
[valide,value,score]=lenet(J);
disp(j);
if value==6
j=j+1;
end

end
disp(j);