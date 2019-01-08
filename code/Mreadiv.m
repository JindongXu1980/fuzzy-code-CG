% 子函数
function [I,data] = Mreadiv()
%   data  -----  待聚类数据
%   I     -----   初始图像矩阵

clear all;
close all;

% for samples-structured face database
 samples =3; 

% I = imread('spot5sub.tif');
I = imread('spotsub0823.bmp');
imshow(I);
[imageWidth,imageHeight] = size(I(:,:,1));
figure,imhist(I(:,:,1));
sampleSet=zeros(imageWidth,imageHeight,samples);
sampleSet = double(I); 

A = zeros(imageWidth*imageHeight,samples);
for m=1:samples
  A(:,m) = reshape(sampleSet (:,:,m),imageWidth*imageHeight,1);
end
data=A;
% t = 10;
[Dim, NumOfSampl] = size(A);
data = zeros(imageWidth*imageHeight,samples,2);

  for j = 1:Dim
      junzhi = mean(A(j,:));
      fangcha= var(A(j,:));
    for i = 1:NumOfSampl
%       if A(j,i)>junzhi+3*fangcha
        data(j,i,1)=A(j,i)-fangcha/2;
        data(j,i,2)=A(j,i)+fangcha/2;
%       end
% %       if A(j,i)<junzhi-3*fangcha
%         A(j,i)=junzhi-3*fangcha; 
%       end
    end
  end
% %   t = t-1;
%   
% end