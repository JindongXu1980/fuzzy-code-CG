% 子函数
function out = distfcm(center, data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
%   out        ---- 距离


% The Euclidean distance d between two vectors X and Y is: 
% d = sqrt(sum((x-y).^2))

%马氏距离
% c=cov(data);
% d = mahalanobis(data, center, c);
% out=d';
%====END
out = zeros(size(center, 1), size(data, 1));
for k = 1:size(center, 1), % 对每一个聚类中心
%     % 每一次循环求得所有样本点到一个聚类中心的距离
    out(k, :) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
    
end