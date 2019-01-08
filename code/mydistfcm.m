% 子函数
function out = mydistfcm(center, data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
%   out        ---- 距离
% out1=mdistfcm(center, data);
 out2=udistfcm(center, data);
% out=0.6*out1+0.4*out2;
out=out2;
