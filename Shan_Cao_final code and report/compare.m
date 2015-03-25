clc;clear;close all;
load mnist_all.mat
load handwrittendigits.mat
c=imread('33.png');
index=double(randi(size(test6,1),1));

a=single(test6(index,:));
a1=reshape(a,28,28);

b=X(3440,:);
b2=reshape(b,20,20);
b2=normalize(b2);
b2=b2;
subplot(1,2,1);
image(a1);
subplot(1,2,2)
image(b2);

% subplot(2,2,3)
% c1=normalize(single(rgb2gray(c)));
% image(c1);
