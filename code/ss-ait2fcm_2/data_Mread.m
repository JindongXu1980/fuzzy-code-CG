% �Ӻ���
function [I,data,samples] = data_Mread()
%   data  -----  ����������
%   I     -----   ��ʼͼ�����

clear all;
close all;
clc;

% for samples-structured face database

% I=imread('xizang541sub.bmp');
%   I=imread('E:\Reseaching\IntevalValuedFuzzy\FCM\xizang541sub.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\�����sub0220.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\yushusub0606541.bmp');
% I = imread('E:\Reseaching\IntevalValuedFuzzy\FCM\Hengqinsub1121nSpot.bmp');
% I=imread('E:\Reseaching\IntevalValuedFuzzy\FCM\yushusub33.bmp');
%  I = imread('gd&ao123.bmp');
% I = imread('yssub07112.bmp');
% I = imread('20030729tmsub0711.tif');
% I = imread('E:\E\��Ҫ����\����\��ҵ��ƺػ�\fcm\ԭͼ.bmp');
% I = imread('yushusub33.bmp');
I = imread('�¼�.bmp');
% I = imread('ͼ3(a) .tif');
% I = imread('yushusub0716.tif');
% I=imread('yushusub7410711.bmp');
%===��ʾԭͼ
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
%======END��ʾԭͼ
sampleSet=zeros(imageWidth,imageHeight,samples);
sampleSet=I;
A = zeros(imageWidth*imageHeight,samples);

% %=======ѡ�񲨶β��� 
% samples=3;
% Z=zeros(imageWidth,imageHeight,samples);
% D = zeros(imageWidth*imageHeight,samples);
% 
% Z(:,:,1)=I(:,:,1);
% Z(:,:,2)=I(:,:,2);
% Z(:,:,3)=I(:,:,4);
% I=Z;
%=======ѡ�񲨶β��� END

for m=1:samples
  A(:,m) = reshape(sampleSet (:,:,m),imageWidth*imageHeight,1);
%   D(:,m) = reshape(Z(:,:,m),imageWidth*imageHeight,1);%=======ѡ�񲨶β���
end

data=A;
% data=D;%=======ѡ�񲨶β���