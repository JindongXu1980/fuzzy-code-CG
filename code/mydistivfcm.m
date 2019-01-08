% 子函数
function out =mydistivfcm(center, ddown,dup)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
% %   out        ---- 距离
d1=mdistivfcm(center, ddown,dup);
% % % % 
% d2=jwudistivfcm(center, ddown,dup);
% % % % %  out=out2;
d3 = adadistivfcm(center, ddown,dup);
d4 = maxdistivfcm(center, ddown,dup);
% d5 = Cosdistivfcm(center, data)
% d5=udistivfcm(center,ddown,dup);
% out=d1+d2+d3+d4;
% out1=max(d1,d2);
% % out2=max(d3,d4);
%  out=max(max(max(d3,d2),d1),d4);
  out=max(min(d1,d3),d4);
% out=(d3+d4)/2;
% out=d4;

