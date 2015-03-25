clc;
clear;
close all;

for i=1:100
% [file path] = uigetfile('*.png','Image Files');
% img = imread([path file]);
s=['img=imread(''/home/scao/Desktop/Caffe/caffe-master/matlab/caffe/image/',int2str(i),'.png'');'];
eval(s);
img = rgb2gray(img);


img_edge = edge(img,'canny');

%Find the filled image
img_filled = imfill(img_edge,'holes');

imshow(img_filled);

%Now find the region with the maximum area
props = regionprops(img_filled,'Area','PixelList');

max_area = props(1).Area;
max_count = 1;
for count=1:size(props,1)
    if(max_area < props(count).Area)
        max_area = props(count).Area; %find the region with lagest region area
        max_count = count;
    end
end

if(max_area > 2000)
    
    out_img = zeros([size(img_edge,1) size(img_edge,2)]);

    pixels = props(max_count).PixelList;

    for count=1:size(pixels,1)
        out_img(pixels(count,2),pixels(count,1)) = 1;% re-drew the region buy using the properties of the original image
    end
else
    out_img = img_edge;
end

%Now show the confidence region to the user
conf_region = uint8(double(img) .* double(out_img));

%Apply some edge filtering on the image
text_region = edge(conf_region);

%Now get the text from this area
out_img = double(img) .* text_region;

subplot(2,1,1);
imshow(uint8(img));
subplot(2,1,2);
imshow(uint8(out_img));
pause(0.5)
%close all;
end