clc;clear;close all;
load handwrittendigits.mat
j=0;
for i=1:1:5000
    
index=double(randi(5000,1));% generate 1x1 form 1:5000 int
a=single(X(index,:));
b=y(index);
a1=reshape(a,20,20);
a1=flipud(rot90(a1)); %flip up and down
output=lenet(a1);
fprintf('the predict output is:');
disp(output);
fprintf('the groud truth is');
disp(b+1);
if output==b+1
j=j+1;
end
end
s=['the accuracy is ',int2str(j),'/100'];

fprintf(s);


