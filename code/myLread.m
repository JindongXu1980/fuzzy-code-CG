% 子函数
function [SampleSet,A] = myLread()
%   data  -----  待聚类数据
%   I     -----   初始图像矩阵
close all;
clear all;



% for samples-structured face database

% fax = factor(samples);  
% plotHt = prod(fax,2)/fax(length(fax)); 
% plotWd = fax(length(fax));
% 
% % loading the samples set
% disp('Loading the trainging set...');
[lan_data,nbands] = lan_read('sub07112.lan');
 samples = nbands; 
I = lan_data;
for i=1:samples
    subplot(2,4,i); 
  image(I(:,:,i));
end
%I = imread('yaogan1003.bmp');
[imageWidth,imageHeight] = size(I(:,:,1));

SampleSet=zeros(imageWidth,imageHeight,samples);


 SampleSet= double(I);
   
A = zeros(imageWidth*imageHeight,samples);
for m=1:samples
  A(:,m) = reshape(SampleSet (:,:,m),imageWidth*imageHeight,1);
end
 t = 10;
[Dim, NumOfSampl] = size(A);

while t>0
    
  for j = 1:Dim
      junzhi = mean(A(j,:));
      fangcha= var(A(j,:));
    for i = 1:NumOfSampl
      if A(j,i)>junzhi+3*fangcha
        A(j,i)=junzhi+3*fangcha;
      end
      if A(j,i)<junzhi-3*fangcha
        A(j,i)=junzhi-3*fangcha; 
      end
    end
  end
  t = t-1;
  
end
