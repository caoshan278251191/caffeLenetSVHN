clc;clear;close all;
load mnist_all.mat
j=0;
trn_data=zeros(1,196);
for i=1:1:10000
i1=randi(10,1);% generate 1x1 form 1:10 int
s=['index=double(randi(size(test',int2str(i1-1),',1),1));']; %index=double(randi(size(test0,1),1));
eval(s); 
s1=['a=single(test',int2str(i1-1),'(index,:));'];%a=single(test0(index,:));
eval(s1);
a=reshape(a,28,28);
temp1=reshape(a(1:14,1:14),1,196);
temp2=reshape(a(1:14,15:28),1,196);
temp3=reshape(a(1:14,15:28),1,196);
temp4=reshape(a(15:28,15:28),1,196);
trn_data=[trn_data;temp1;temp2;temp3;temp4];


end