% 子函数
function [U_new, center, obj_fcn] = stepfcmnew(data, U, cluster_n,expo,x,mymean,mystd)
% 模糊C均值聚类时迭代的一步
% 输入：
%   data        ---- nxm矩阵,表示n个样本,每个样本具有m的维特征值
%   U           ---- 隶属度矩阵
%   cluster_n   ---- 标量,表示聚合中心数目,即类别数
%   expo        ---- 隶属度矩阵U的指数                      
% 输出：
%   U_new       ---- 迭代计算出的新的隶属度矩阵
%   center      ---- 迭代计算出的新的聚类中心
%   obj_fcn     ---- 目标函数值
% [mymean,mystd]=make_mstd(x,data);

mf = U.^expo;       % 隶属度矩阵进行指数运算结果
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % 新聚类中心(5.4)式
%  dist = distfcm(center, data);       % 计算距离矩阵
%  dist = distfcm(center, data);       % 计算距离矩阵
 dist = mydistfcm(center, data);
obj_fcn = sum(sum((dist.^2).*mf));  % 计算目标函数值 (5.1)式
tmp = dist.^(-2/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));  % 计算新的隶属度矩阵 (5.3)式
% Tmean=mean(mean(data))/255;
% Tstd=std(std(data))/255;
%区间隶属度
[m n]=size(U);
pi=3.1415926;
pp=sqrt(2*pi);
a=1.25;
b=1/a;
%方法1
UL=U_new.^a;
UR=U_new.^b;
%方法1end
%方法2
% 
% UL=(1/(pp*Tstd)*exp( -0.5.*(((U_new-Tmean)./Tstd).^2))).^a;
% UR=(1/(pp*Tstd)*exp( -0.5.*(((U_new-Tmean)./Tstd).^2))).^b;

%方法2end
%方法3
% mymean=mean(mymean');
% mystd=mean(mystd');
% for k=1:cluster_n
% UL(k,:)=(1/(pp*Tstd)*exp( -0.5.*(((U_new(k,:)-mymean)/Tstd).^2))).^a;
% UR(k,:)=(1/(pp*Tstd)*exp( -0.5.*(((U_new(k,:)-mymean)/Tstd).^2))).^b;
% end
a=zeros(1,cluster_n)
for k=1:cluster_n
U_new(k,:) = UR(k,:)-a(k).*2*data.*(UR(k,:)-UL(k,:))
end

%方法3end
for i=1:m
    for j=1:n
        if(U_new(i,j)>0.5)
            U_new(i,j)=0.4*UL(i,j)+0.6*UR(i,j);
        else
            U_new(i,j)=0.6*UL(i,j)+0.4*UR(i,j);
        end
    end
end

% t1=mean(mymean');
% t2=std(mystd');

% for i=1:cluster_n
% UL(i,:)=(exp( -0.5.*(((U_new(i)- t1)./t2).^2))./(pp*t2)).^a;
% UR(i,:)=(exp( -0.5.*(((U_new(i)- t1)./t2).^2))./(pp*t2)).^b;
% end
            