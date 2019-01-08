% 子函数
function aout = adadistivfcm(center, ddown, dup)
% function mout = mdistivfcm(center, meana,stda,data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
%    r         ----区间分段数
% 输出：
%   mout        ---- 距离
% %======区间构造法4 假定原数据为区间的中值
% [m,n]=size(data);
% t=2*std(data)*0.1;
% t3 =1.0;
% % t=2.0*std(data)*0.1;
% t1=ones(size(data,1),1);
% stda=ones(size(data,1),1)*t;
% data1=data-t3*stda;
% for i=1:m
%     for j=1:n
%      % data1(i,j)=data(i,j)-stda(i,j)
%       if(data1(i,j)<0)
%           data1(i,j)=0;       
%       end
%     end
% end
% data2=data+stda;
%========END
data1=ddown;
data2=dup;
aout = zeros(size(center, 1), size(data1, 1));
%距离度量参考文献：Liem Tran,Lucien Duckstein.Comparison of fuzzy numbers using a
% % %fuzzy distance measure[J].Fuzzy Sets and Systems,2002,130:331-341
 for k = 1:size(center, 1) % 对每一个聚类中心
% 
% %   s1=ones(size(data,1),1)*center(k,:,1);
% %   s2=ones(size(data,1),1)*center(k,:,2);
% %  out(k, :) =max(((data1+data2)/2+(ones(size(data,1),1)*center(k,:,1)+ones(size(data,1),1)*center(k,:,2))/2).^2',[],1)+max(1/3.0*(((data2-data1)/2).^2+((ones(size(data,1),1)*center(k,:,2)-ones(size(data,1),1)*center(k,:,1))/2).^2)',[],1);
%  aout(k, :) =abs(sqrt(sum(((data1+data2)/2-(ones(size(data,1),1)*(center(k,:,1)+center(k,:,2)))/2).^2',1)+sum(1/3.0*(((data2-data1)/2).^2+((ones(size(data,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)',1)));
 aout(k, :) =sum(sqrt(((data1+data2)/2-(ones(size(data1,1),1)*(center(k,:,1)+center(k,:,2)))/2).^2'+1/3.0*(((data2-data1)/2).^2+((ones(size(data1,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)'),1);
 %   out(k, :) =sqrt(((data1+data2)/2-(ones(size(data1,1),1)*(center(k,:,1)+center(k,:,2))/2)).^2'+1/3.0*(((data2-data1)/2).^2+((ones(size(data1,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)');
 
% 
end