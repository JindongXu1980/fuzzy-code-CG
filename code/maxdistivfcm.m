% 子函数
function maxout = maxdistivfcm(center,ddown,dup)
% function mout = mdistivfcm(center, meana,stda,data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
% 输出：
%   uout        ---- 距离
%极大值距离
data1=ddown;
data2=dup;
% [p q]=size(data1);
maxout = zeros(size(center, 1), size(data1, 1));
 for k = 1:size(center, 1) % 对每一个聚类中心
% % % % %     % 每一次循环求得所有样本点到一个聚类中心的距离(按照法1构造区间数 )
% % % % 
% % % %      maxout(k, :) = max(abs(sqrt(sum(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1))),abs(sqrt(sum(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1))));
% % % % % %        % 每一次循环求得所有样本点到一个聚类中心的距离(按照法2构造区间数 )
% % % % out(k, :) = max(abs(sqrt(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1)),abs(sqrt(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1)));
% % % % % %        % 每一次循环求得所有样本点到一个聚类中心的距离(按照法4构造区间数 ):最符合文献公式
 maxout(k, :)=sum( max(abs(data1-ones(size(data1,1),1)*center(k,:,1)),abs(data2-ones(size(data1,1),1)*center(k,:,2)))',1);%各维距离累加
% 最大距离定义
% maxout(k, :)=10.* max( max(abs(data1-ones(size(data1,1),1)*center(k,:,1)),abs(data2-ones(size(data1,1),1)*center(k,:,2)))');%各维距离最大值
% % % % % ＝＝＝＝＝＝ＥＮＤ        

end