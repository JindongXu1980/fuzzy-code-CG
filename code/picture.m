clear;
I=imread('ÐÂ¼Ó.bmp');
I=I(:,:,1:3);
% imshow(I,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 795 452]);
% axis normal;


% I2=imcrop(I,[1 129 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;

% I2=imcrop(I,[600 1 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;


% I2=imcrop(I,[200 308 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;

% I2=imcrop(I,[24 28 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;

% I2=imcrop(I,[395 5 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;

% I2=imcrop(I,[636 389 100 100]);
% imshow(I2,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 100 100]);
% axis normal;

I2=imcrop(I,[1 224 99 99]);
imshow(I2,'border','tight','initialmagnification','fit');
set(gcf,'Position',[0 0 100 100]);
axis normal;

I2=imcrop(I,[488 165 73 54]);
imshow(I2,'border','tight','initialmagnification','fit');
set(gcf,'Position',[0 0 135 100]);
axis normal;

I2=imcrop(I,[207 408 80 44]);
imshow(I2,'border','tight','initialmagnification','fit');
set(gcf,'Position',[0 0 182 100]);
axis normal;


% 
% % data=B1;
% B=uint8(zeros(591,736,3));      
% for i=1:591
%      for j=1:736               
%        if data(i,j)==5  
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==1 
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==2
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%        end
%        if data(i,j)==3
%             B(i,j,1)=0;   
%             B(i,j,2)=255;
%             B(i,j,3)=255;  
%          end
%        if data(i,j)==4 
%           B(i,j,1)=105;  
%           B(i,j,2)=139;
%           B(i,j,3)=34;
%        end
%      end
%       end
% imshow(B,'border','tight','initialmagnification','fit');
% set(gcf,'Position',[0 0 736 591]);
% axis normal;