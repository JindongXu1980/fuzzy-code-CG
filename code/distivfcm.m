% 子函数
function out = distivfcm(center, data)
% function out = distivfcm(center, meana,stda,data)
% 计算样本点距离聚类中心的距离
% 输入：
%   center     ---- 聚类中心
%   data       ---- 样本点
%    r         ----区间分段数
% 输出：
%   out        ---- 距离
out = zeros(size(center, 1), size(data, 1));
% R = exp( -0.5*((data-mean(mean(data)))/std(std(data))).^2);
% R = exp( -0.5*((data-mean(mean(data))).^2)/var(var(data)));
% data1 =  R.^2;
% data2 = R.^0.5;
% data1=0.85.*data;
% data2=1.15.*data;
% data3=(data1+data2)./2
% center1=center(:,:,1);
% center2=center(:,:,2);
% center3=(center1+center2)/2;
% % % %马氏距离
% c1=cov(data1);
% d1= mahalanobis(data1, center1, c1);
% c2=cov(data2);
% d2= mahalanobis(data2, center2, c2);
% c3=cov(data3);
% d3= mahalanobis(data3, center3, c3);
% % out1=max(d1,d2);
% % out=max(out1,d3)';
% out=(d1+d2+d3)';
%===区间法3
% [x,y]=size(data);
% meana=zeros(x,y);
% stda=zeros(x,y);
% for i=1:x
% meana(i,:)=mean(data(i,:));
% stda(i,:)=std(data(i,:));
% end
% data1=meana-2*stda;
% data2=meana+2*stda;
%===区间法4
[m,n]=size(data);
t=2.0*std(data)*0.1;
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
%=============马氏距离
% data3=(data1+data2)./2
% center1=center(:,:,1);
% center2=center(:,:,2);
% center3=(center1+center2)/2;
% 
% c1=cov(data1);
% d1= mahalanobis(data1, center1, c1);
% c2=cov(data2);
% d2= mahalanobis(data2, center2, c2);
% c3=cov(data3);
% d3= mahalanobis(data3, center3, c3);
% % out1=max(d1,d2);
% % out=max(out1,d3)';
%  out=(d1+d2+d3)';
%%====END

% %＝＝＝＝＝绝对值距离公式&欧式距离
  for k = 1:size(center, 1) % 对每一个聚类中心
% % % % %     % 每一次循环求得所有样本点到一个聚类中心的距离(按照法1构造区间数 )
% % % % 
% % % %      out(k, :) = max(abs(sqrt(sum(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1))),abs(sqrt(sum(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1))));
% % % % % %        % 每一次循环求得所有样本点到一个聚类中心的距离(按照法2构造区间数 )
% % % % out(k, :) = max(abs(sqrt(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1)),abs(sqrt(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1)));
% % % % % %        % 每一次循环求得所有样本点到一个聚类中心的距离(按照法4构造区间数 ):最符合文献公式
%  out(k, :) =sum( max(abs(data1-ones(size(data,1),1)*center(k,:,1)),abs(data2-ones(size(data,1),1)*center(k,:,2)))',1);
% % % % % ＝＝＝＝＝＝ＥＮＤ        
% % % % % 
% % % % % % ======欧式距离公式
 out(k, :)=sqrt(sum((data1-ones(size(data,1),1)*center(k,:,1)).^2',1)+sum((data2-ones(size(data,1),1)*center(k,:,2)).^2',1));
% % % % % %======欧式距离END
end
%距离度量参考文献：Liem Tran,Lucien Duckstein.Comparison of fuzzy numbers using a
% % %fuzzy distance measure[J].Fuzzy Sets and Systems,2002,130:331-341
% for k = 1:size(center, 1) % 对每一个聚类中心
% 
% %   s1=ones(size(data,1),1)*center(k,:,1);
% %   s2=ones(size(data,1),1)*center(k,:,2);
% %  out(k, :) =max(((data1+data2)/2+(ones(size(data,1),1)*center(k,:,1)+ones(size(data,1),1)*center(k,:,2))/2).^2',[],1)+max(1/3.0*(((data2-data1)/2).^2+((ones(size(data,1),1)*center(k,:,2)-ones(size(data,1),1)*center(k,:,1))/2).^2)',[],1);
%  out(k, :) =sqrt(sum(((data1+data2)/2-(ones(size(data,1),1)*(center(k,:,1)+center(k,:,2)))/2).^2',1)+sum(1/3.0*(((data2-data1)/2).^2+((ones(size(data,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)',1));
% %  out(k, :) =sum(sqrt(((data1+data2)/2-(ones(size(data,1),1)*(center(k,:,1)+center(k,:,2)))/2).^2'+1/3.0*(((data2-data1)/2).^2+((ones(size(data,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)'),1);
%  %   out(k, :) =sqrt(((data1+data2)/2-(ones(size(data1,1),1)*(center(k,:,1)+center(k,:,2))/2)).^2'+1/3.0*(((data2-data1)/2).^2+((ones(size(data1,1),1)*(center(k,:,2)-center(k,:,1)))/2).^2)');
%  
% % 
% end