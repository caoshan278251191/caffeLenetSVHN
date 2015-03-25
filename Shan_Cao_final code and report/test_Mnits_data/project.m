clc;clear;close all;
load mnist_all.mat
j=0;
for i=1:1:100
i1=randi(10,1);% generate 1x1 form 1:10 int
s=['index=double(randi(size(test',int2str(i1-1),',1),1));']; %index=double(randi(size(test I ,1),1));
eval(s); 
s1=['a=single(test',int2str(i1-1),'(index,:));'];%a=single(test0(index,:));
eval(s1);
%b=y(index);
a1=reshape(a,28,28);
% a1=fliplr(flipud(rot90(rot90(rot90(a1)))));
output=lenet(a1);
fprintf('the predict output is:');
disp(output);
fprintf('the groud truth is');
disp(i1-1)
if output==i1-1 
j=j+1;
end
end
disp(j);