function [center, U_u, obj_fcn,BB] = FCMClust(udata,cluster_n)
% FCMClust.m   采用模糊C均值对数据集data聚为cluster_n类 
%
% 用法：
%   1.  [center,U,obj_fcn] = FCMClust(Data,N_cluster,options);
%   2.  [center,U,obj_fcn] = FCMClust(Data,N_cluster);
%   
% 输入：
%   data        ---- nxm矩阵,表示n个样本,每个样本具有m的维特征值
%   N_cluster   ---- 标量,表示聚合中心数目,即类别数
%   options     ---- 4x1矩阵，其中
%       options(1):  隶属度矩阵U的指数，>1                  (缺省值: 2.0)
%       options(2):  最大迭代次数                           (缺省值: 100)
%       options(3):  隶属度最小变化量,迭代终止条件           (缺省值: 1e-5)
%       options(4):  每次迭代是否输出信息标志                (缺省值: 1)
% 输出：
%   center      ---- 聚类中心
%   U           ---- 隶属度矩阵
%   obj_fcn     ---- 目标函数值
%   Example:
  %     data = rand(100,2);
 %      [center,U,obj_fcn] = FCMClust(data,2);
  %     plot(data(:,1), data(:,2),'o');
 %      hold on;
 %      maxU = max(U);
 %      index1 = find(U(1,:) == maxU);
 %      index2 = find(U(2,:) == maxU);
  %     line(data(index1,1),data(index1,2),'marker','*','color','g');
  %     line(data(index2,1),data(index2,2),'marker','*','color','r');
 %     plot([center([1 2],1)],[center([1 2],2)],'*','color','k')
 %      hold off;
 
% in_n = size(udata, 2);   % 求出data的第二维(columns)数，即特征值长度
% 默认操作参数
options = [2.5; % 隶属度矩阵U的指数
    100;                % 最大迭代次数 
    0.01;               % 隶属度最小变化量,迭代终止条件
    1];                 % 每次迭代是否输出信息标志 

expo = options(1);          % 隶属度矩阵U的指数
max_iter = options(2);  % 最大迭代次数 
min_impro = options(3);  % 隶属度最小变化量,迭代终止条件
display = options(4);  % 每次迭代是否输出信息标志 

obj_fcn = zeros(max_iter, 1); % 初始化输出参数obj_fcn
BB=[];
[U_u,center] = initfcm(cluster_n,udata,expo);     % 初始化模糊分配矩阵,随机初始化中心
% Main loop  主要循环
for i = 1:max_iter,
    %在第k步循环中改变聚类中心ceneter,和分配函数U的隶属度值;
    [U_ulow,U_uup] = cu(center,cluster_n,udata,expo);% 构建隶属度区间
%    U_u=(U_ulow+U_uup)/2;
    [U_u,AA]=changeait2fm(U_ulow,U_uup,U_u,udata,center,expo,i);% 自适应降型
    BB=[BB AA];
%     v2=center;
 [center, obj_fcn(i)] = stepfcm(udata, U_u,expo);% 更新聚类中心
 if display, 
  fprintf('FCM:Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
 end
%  终止条件判别
 if i > 1,
  if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, 
            break;
  end
        
 end

% d=sum(sum(abs(center-v2)));
% if abs(d)<min_impro
%     break;
% end




end

% iter_n = i; % 实际迭代次数 
% obj_fcn(iter_n+1:max_iter) = [];





% index=zeros(size(udata,1),1);
%  maxU = max(U_u);
%   for i = 1:cluster_n
%       for ii =1:size(udata,1)
%           if(find(U_u(i,ii) == maxU))
%            index(ii,1) =i;
%           end
% %  outc=data(index,:)
%       end
%   end
end
% maxU = max(U);
% for i = 1:cluster_n
% index = find(U(i,:) == maxU);
%  outc=data(index,:)
% end