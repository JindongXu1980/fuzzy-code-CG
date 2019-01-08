% 子函数
function Cosout = Cosdistivfcm(center, data)
% function mout = mdistivfcm(center, meana,stda,data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
%   uout        ---- 距离
%极大值距离
[m,n]=size(data);
t=2.0*std(data)*0.1;
% t=2.0*std(data)*0.1;
t1=ones(size(data,1),1);
stda=ones(size(data,1),1)*t;
data1=data-stda;
for i=1:m
    for j=1:n
     % data1(i,j)=data(i,j)-stda(i,j)
      if(data1(i,j)<0)
          data1(i,j)=0;       
      end
    end
end
data2=data+stda;
y1=center(:,:,1);
y2=center(:,:,2);
d1= pdist2(data1,y1,'cosine') ;
d2=  pdist2(data2,y2,'cosine') ;
Cosout = d1+d2;