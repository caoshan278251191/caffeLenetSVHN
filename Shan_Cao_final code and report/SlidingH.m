function output=SlidingH(im)

[col,row]=size(im);
b=single(rgb2gray(b));
% h= text(20,20,int2str(c),'FontSize', 1,'color','y','Fontweight','bold');
Nth=3; %number of class you want
%Smooth parameter
sm=1.5;
B1=fth(b,Nth,[0,3],sm);
win_size =[col,4];
for s=1:1:3 % s means scale there is 3 possible number in each picture
    value1=0;
    score1=0;
    value2=0;
    value3=0;
    
    
    X1=win_size(2)*s;
    for x = 1:2:32
        p1 = [x,0];
        p2 = [x+(X1-1), 31];
        im_temp=imcrop(B1,[p1(1) p1(2) X1 32]);
        % rectangle('position',[p1(1) p1(2) X1 32],'edgecolor','r');
        index=im_temp;
        if im_temp(1,1)==1
            im_temp(index==1)=2;
            im_temp(index==2)=1;
            im_temp(index==3)=0; % because nth=3 so we only change 3 different.
            
        end
        if ~isempty(im_temp)
            [valide,value,score]=lenet(im_temp);
           
        end
        if valide==1
           value1=[value1 value] 
        end
    end
        [value2,times]= mode(value1,2); %% 
        value3=[value3 valu2];% save possible value in differet scale
end
[output,times]= mode(value1,2); % based on the value generated from different scale, try to give out best answer
fprintf('finished');