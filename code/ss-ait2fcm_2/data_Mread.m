% 子函数
function [I,data,samples] = data_Mread()
%   data  -----  待聚类数据
%   I     -----   初始图像矩阵

clear all;
close all;
clc;

% for samples-structured face database

% I=imread('xizang541sub.bmp');
%   I=imread('E:\Reseaching\IntevalValuedFuzzy\FCM\xizang541sub.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\多光谱sub0220.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\yushusub0606541.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\Hengqinsub1121nSpot.bmp');
% I=imread('E:\Reseaching\IntevalValuedFuzzy\FCM\yushusub33.bmp');
%  I = imread('gd&ao123.bmp');
% I = imread('yssub07112.bmp');
% I = imread('20030729tmsub0711.tif');
% I = imread('E:\E\重要备份\区间\毕业设计贺辉\fcm\原图.bmp');
% I = imread('yushusub33.bmp');
I = imread('新加.bmp');
% I = imread('图3(a) .tif');
% I = imread('yushusub0716.tif');
% I=imread('yushusub7410711.bmp');
%===显示原图
[imageWidth,imageHeight,samples] = size(I);
% figure,
% for i=1:samples
%     subplot(2,3,i); 
%   imshow(I(:,:,i));
% end
%  imshow(I);

% figure, 
% for i=1:samples
%     subplot(2,3,i); 
%   imhist(I(:,:,i));
% end
%======END显示原图
sampleSet=zeros(imageWidth,imageHeight,samples);
sampleSet=I;
A = zeros(imageWidth*imageHeight,samples);

% %=======选择波段参与 
% samples=3;
% Z=zeros(imageWidth,imageHeight,samples);
% D = zeros(imageWidth*imageHeight,samples);
% 
% Z(:,:,1)=I(:,:,1);
% Z(:,:,2)=I(:,:,2);
% Z(:,:,3)=I(:,:,4);
% I=Z;
%=======选择波段参与 END

for m=1:samples
  A(:,m) = reshape(sampleSet (:,:,m),imageWidth*imageHeight,1);
%   D(:,m) = reshape(Z(:,:,m),imageWidth*imageHeight,1);%=======选择波段参与
end

data=A;
% data=D;%=======选择波段参与