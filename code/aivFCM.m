function [center_new, U, obj_fcn] = aivFCM(data,ddown,dup,center, cluster_n,means)



data_n = size(data, 1); % 求出data的第一维(rows)数,即样本个数
in_n = size(data, 2);   % 求出data的第二维(columns)数，即特征值长度
% 默认操作参数
options = [2.5; % 隶属度矩阵U的指数
    500;                % 最大迭代次数 
    1e-5;               % 隶属度最小变化量,迭代终止条件
    1];                 % 每次迭代是否输出信息标志 


%将options 中的分量分别赋值给四个变量;
expo = options(1);          % 隶属度矩阵U的指数
max_iter = options(2);  % 最大迭代次数 
min_impro = options(3);  % 隶属度最小变化量,迭代终止条件
display = options(4);  % 每次迭代是否输出信息标志 

obj_fcn = zeros(max_iter, 1); % 初始化输出参数obj_fcn


% [ddown,dup,sec,means]=section2(data);


U = initaivfcm(center,ddown,dup,expo);     % 初始化模糊分配矩阵,使U满足列上相加为1,



% Main loop  主要循环

for i = 1:max_iter,
    %在第k步循环中改变聚类中心ceneter,和分配函数U的隶属度值;
%  [U, center, obj_fcn(i)] = jwstepivfcm(ddown,dup, U, cluster_n, expo);
 [U_new, center_new, obj_fcn(i)]=stepaivfcm(ddown,dup, U, cluster_n, expo);
 [ddown,dup]=changeaiv(means,U_new,data,center_new);
 if display, 
  fprintf('FCM:Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
 end
 % 终止条件判别
 if i > 1,
  if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, 
            break;
        end,
 end
end

iter_n = i; % 实际迭代次数 
obj_fcn(iter_n+1:max_iter) = [];