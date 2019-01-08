% 子函数
function [I,data] = read()
%   data  -----  待聚类数据
close all;
clear all;

% for samples-structured face database
 samples =3; 

 I=imread('spotsub0823.bmp');
% I = imread('spot5sub.tif');
% I = imread('spotsub0724.bmp');
imshow(I);
[imageWidth,imageHeight] = size(I(:,:,1));
figure,imhist(I(:,:,1));
sampleSet=zeros(imageWidth,imageHeight,samples);
% for m = 2:samples
%   sampleImage = double(imread(strcat('D:\工作\ICA\FastICA_21new\FastICA_21\',num2str(m),'.jpg'),'jpg'));
% I = imread('01.jpg');


%   sampleSet(:,:,m) = sampleImage;
%  sampleSet(:,:,m) = I;
% end
   sampleSet = double(I); 

A = zeros(imageWidth*imageHeight,samples);
for m=1:samples
  A(:,m) = reshape(sampleSet (:,:,m),imageWidth*imageHeight,1);
end
data=A;
% t = 10;
% [Dim, NumOfSampl] = size(A);
% data = zeros(imageWidth*imageHeight,samples,2);
% % while t>0
%     
%   for j = 1:Dim
%       junzhi = mean(A(j,:));
%       fangcha= var(A(j,:));
%     for i = 1:NumOfSampl
%       if A(j,i)>junzhi+3*fangcha
%         A(j,i)=junzhi+3*fangcha;
%       end
%       if A(j,i)<junzhi-3*fangcha
%         A(j,i)=junzhi-3*fangcha; 
%       end
%     end
%   end
%   t = t-1;
%   
% end