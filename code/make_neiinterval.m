% 子函数
function [ddown,dup,B] = make_neiinterval(I,data)
%   data  -----  待聚类数据
%   I     -----   初始图像矩阵
% [I,data,samples] = Mread();
%===显示原图
[imageWidth,imageHeight,samples] = size(I);
% samples=samples-1;
% figure,
% for i=1:samples
%     subplot(2,3,i); 
%   imshow(I(:,:,i));
% end
% %  imshow(I);
% 
% figure, 
% for i=1:samples
%     subplot(2,3,i); 
%   imhist(I(:,:,i));
% end
%======END显示原图

%========求解局部方差
%输入：多波段图像
%输出：方差图

fun1= @(x)std2(x)*ones(size(x));
fun2=@(x)mean2(x)*ones(size(x));

% fun3=@(x)median(x)*ones(size(x));
% [imageWidth,imageHeight] = size(I(:,:,1));

X=zeros(imageWidth,imageHeight,samples);
Y=zeros(imageWidth,imageHeight,samples);


% X=zeros(imageHeight,imageWidth,samples);
% Y=zeros(imageHeight,imageWidth,samples);

for j=1:samples
% %  %%=======选择波段参与 
%    X(:,:,j) = blkproc(Z(:,:,j),[ 3 3],fun1);
%    Y(:,:,j) = blkproc(Z(:,:,j),[ 9 9],fun2);
% %  %=======END
   %===所有波段
   
   X(:,:,j) = blkproc(I(:,:,j),[ 3 3],[2 2],fun1);
   Y(:,:,j) = blkproc(I(:,:,j),[ 7 7],fun2);
   %===END
end

%=========Display
% for i=1:samples
%     subplot(2,3,i); 
%   imtool(X(:,:,i),[]);
% end

% figure, 
% for i=1:samples
%     subplot(2,3,i); 
%   imhist(X(:,:,i));
% end
%=====END
A = zeros(imageWidth*imageHeight,samples);
B = zeros(imageWidth*imageHeight,samples);
C = zeros(imageWidth*imageHeight,samples);
D = zeros(imageWidth*imageHeight,samples);
%=========END





for m=1:samples
 
  B(:,m) = reshape(X(:,:,m),imageWidth*imageHeight,1);
  C(:,m) = reshape(Y(:,:,m),imageWidth*imageHeight,1);
%   D(:,m) = reshape(Z(:,:,m),imageWidth*imageHeight,1);
end


%======区间数据构造法5:首先计算5x5邻域的均值和方差，然后按照均值+-2倍方差构造区间
% t=2.0*std(data);
t=2.0*B;
t1=0.5*B;
[x,y]=size(data);

ddown=data-t1;
for i=1:x
    for j=1:y
     % data1(i,j)=data(i,j)-stda(i,j)
      if(ddown(i,j)<0)
          ddown(i,j)=0;       
      end
    end
end
% dup=data+t;
dup=data+t1;