% 子函数
function U = initivfcm(cluster_n, data_n)
% 初始化fcm的隶属度函数矩阵
% 输入:
%   cluster_n   ---- 聚类中心个数
%   data_n      ---- 样本点数
% 输出：
%   U           ---- 初始化的隶属度矩阵
% cluster_n =3;
% data_n=6;
 U=rand(cluster_n, data_n);
% U1 = rand(cluster_n, data_n);
% U2=1.8.*U1;
col_sum = sum(U);
% U1 = U1./col_sum(ones(cluster_n, 1), :);
% U2 = U2./col_sum(ones(cluster_n, 1), :);
% U(:,:,1)=U1;
% U(:,:,2)=U2;
U = U./col_sum(ones(cluster_n, 1), :);