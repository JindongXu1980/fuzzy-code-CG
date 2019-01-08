% 子函数
function mout = mdistivfcm(center,ddown,dup)
% function mout = mdistivfcm(center, meana,stda,data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
%    r         ----区间分段数
% 输出：
%   mout        ---- 距离
data1=ddown;
data2=dup;
mout = zeros(size(center, 1), size(data1, 1));
% % % %马氏距离
data3=(data1+data2)./2;
center1=center(:,:,1);
center2=center(:,:,2);
center3=(center1+center2)/2;

c1=cov(data1);
d1= mahalanobis(data1, center1, c1)';
c2=cov(data2);
d2= mahalanobis(data2, center2, c2)';
c3=cov(data3);
d3= mahalanobis(data3, center3, c3)';
out1=max(d3,d2);
%  mout=max(max(d1,d2),d3);
%参考文献：
% mout=double(d1+d2);
%%====END
% 