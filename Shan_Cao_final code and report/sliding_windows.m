clc;clear;close all;
im=imread('12.png');
im=rgb2gray(im);
%% 
%% 
lastRightCol=size(im,1);
lastRightRow=size(im,2);
win_size =[20,10]; 
%im=rgb2gray(im);
y1=0;
%imshow(im);
%hold on
for s=1:1:3 % s means scale
    tic;
        disp(strcat('s is',num2str(s)));
        X=win_size(1)*s;
        Y=win_size(2)*s;
        for y = 1:5:lastRightCol-Y
            for x = 1:2:lastRightRow-X
                p1 = [x,y];
                p2 = [x+(X-1), y+(Y-1)];
                im=imcrop(im,[p1(1) p1(2) p2(2)-p1(2) p2(1)-p1(1)]);
               % rectangle('position',[p1(1) p1(2) p2(2)-p1(2) p2(1)-p1(1) ],'edgecolor','r');
                [valide,value]=lenet(im);
                if valide==1
                    y1=y1+1;
                    im(x,y)=1;
                end
%                 disp(valide);
%                 disp(value);
                %po = [p1; p2] ;
               % imcrop
               % disp(po);
                %count = counter+1;
                x = x+2;
              % pause(0.1);
            end
        end
        disp(y1);
         toc;
end
%hold off