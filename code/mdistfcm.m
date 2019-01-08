function out = mdistfcm(center, data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
%   out        ---- 距离
%马氏距离
c=cov(data);
d = mahalanobis(data, center, c);
out=d';
%====END