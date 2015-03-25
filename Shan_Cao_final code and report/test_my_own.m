clc;
clear;
close all;

I=imread('digit.jpg');
% figure;
imshow(I);
Igray=rgb2gray(I);
% figure;
% imshow(Igray);

level=0.9;
Ibw=im2bw(Igray,level);
%imshow(Ibw);

% invert the imput image
Ifill=~Ibw;
figure;
%imshow(Ifill);

%mophology
%Ifill=imfill(Ifill,'holes' ); %fill hole in input image

SE = strel('rectangle',[2 2]);
Ifill = imerode(Ifill,SE);
SE = strel('rectangle',[3 3]);
Ifill = imdilate(Ifill,SE);
%blobs analysis
[Ilabel,num]=bwlabel(Ifill);
disp(num);
Iprops=regionprops(Ilabel);%Label connected components in 2-D binary image
Ibox=[Iprops.BoundingBox];
Ibox=reshape(Ibox,[4 num]);
imshow(Ifill);



%crop the picture out
for cnt=1:num
    cor=Ibox(:,cnt);
    disp(cor)
    s=['image_',int2str(cnt),'=imcrop(Ifill,[cor(1),cor(2),cor(3),cor(4)]);']; % image(num)=imcrop(Ifill,[cor(1),cor(2),cor(3),cor(4)]);
    eval(s);
   
end 

% make each picture into squre
for cnt=1:num
    s=['image',int2str(cnt),'=change2squre(image_',int2str(cnt),',num);'];
    eval(s);
    %image1=change2squre(image_1,num);
end

% predict the picture
num_output=zeros(num,1);
for cnt=1:num
    s=['num_output(cnt)=predict(image',int2str(cnt),');'];% num_output(num)=predict(image1);
    eval(s);    
end
HA = 'HorizontalAlignment'; HV = 'VerticalAlignment';
% put bounding box around each object
hold on;
for cnt=1:num
    rectangle('position',Ibox(:,cnt),'edgecolor','r');
    cor=Ibox(:,cnt);
   %text(0,0,'(0,0)',HA,'left',HV,'top','color','r','Fontweight','bold'
   h= text(cor(1)+20,cor(2)+20,int2str(num_output(cnt)),'FontSize', 1,'color','y','Fontweight','bold');
end 
hold off