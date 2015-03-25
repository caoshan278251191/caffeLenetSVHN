
% function output=test_32x32_data(count)
clc;
clear;
close all;
count=0;
load 'test_32x32'
for i=1:1:26032
    disp(strcat('this is the No.','  ',int2str(i),' interation'));
    % i=randi(26032,1);
    b=X(:,:,:,i);
    b=single(rgb2gray(b));
    false_pos=0;
    % h= text(20,20,int2str(c),'FontSize', 1,'color','y','Fontweight','bold');
    Nth=3;
    %Smooth parameter
    sm=1.5;
    B1=fth(b,Nth,[0,3],sm);
    win_size =[32,4];
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
                if valide ==1
                    false_pos=false_pos+1;
                end
                
                %                     if (32/X1<4 || value ~=1) % if the rectangle is too thin and the result is not one, get rid of them
                %                         break
                %                     else
                if value~=11
                    value1=[value1 value];
                end
                score1=[score1 score];
            end
        end
        
        if s==1
            string1=['[temp',int2str(s),',times',int2str(s),']= mode(value',int2str(s),',2);'] ; %[temp1,times1]= mode(value1,2);
            eval(string1);%the most frequent value, means the most possible number in the region
        end
        
        if s==2
            string1=['[temp',int2str(s),',times',int2str(s),']= mode(value',int2str(s),',2);'];  %[temp2,times2]= mode(value2,2);
            eval(string1);%the most frequent value, means the most possible number in the region
        end
        
        if s==3
            string1=['[temp',int2str(s),',times',int2str(s),']= mode(value',int2str(s),',2);'];  %[temp2,times3]= mode(value3,2);
            eval(string1);%the most frequent value, means the most possible number in the region
        end
        
        
        
    end
    b1=fix(y(i)/100);c=fix(mod(y(i),100)/10);d=mod(mod(y(i),100),10);
    A_temp=[b1 c d];
    B_temp=[temp1 temp2 temp3];
    A_temp(A_temp==0)=[];
    B_temp(B_temp==0)=[];
    
    
    
    disp([b1 c d]);
    disp([temp1 temp2 temp3]);
    if  isempty(intersect(A_temp,B_temp)) % if there are same items, that means the algoritm has detect the digits out
        output=0;
    else
        output=1;
        count=count+1;
    end
    disp(count);
    
end
fprintf('finished');
disp(false_pos);