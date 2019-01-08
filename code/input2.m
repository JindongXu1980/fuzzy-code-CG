close all;
clear all;



% for samples-structured face database
 samples =6; 
% fax = factor(samples);  
% plotHt = prod(fax,2)/fax(length(fax)); 
% plotWd = fax(length(fax));
% 
% % loading the samples set
% disp('Loading the trainging set...');
[lan_data] = lan_read('sub0711.lan');
I = lan_data;
for i=1:6
    subplot(2,3,i); 
  image(I(:,:,i));
end
%I = imread('yaogan1003.bmp');
[imageWidth,imageHeight] = size(I(:,:,1));

sampleSet=zeros(imageWidth,imageHeight,samples);
% for m = 2:samples
%   sampleImage = double(imread(strcat('D:\นคื๗\ICA\FastICA_21new\FastICA_21\',num2str(m),'.jpg'),'jpg'));
% I = imread('01.jpg');


%   sampleSet(:,:,m) = sampleImage;
%  sampleSet(:,:,m) = I;
% end
   sampleSet = double(I); 
 
% form A -- which is a vector of the difference images
% disp('Vectorising difference images');   
A = zeros(imageWidth*imageHeight,samples);
for m=1:samples
  A(:,m) = reshape(sampleSet (:,:,m),imageWidth*imageHeight,1);
end
%  t = 10;
% [Dim, NumOfSampl] = size(A);
% 
% while t>0
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
