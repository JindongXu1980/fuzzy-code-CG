% �Ӻ���
function U = initfcm(cluster_n, data_n)
% ��ʼ��fcm�������Ⱥ�������
% ����:
%   cluster_n   ---- �������ĸ���
%   data_n      ---- ��������
% �����
%   U           ---- ��ʼ���������Ⱦ���
U = rand(cluster_n, data_n);
col_sum = sum(U);
U = U./col_sum(ones(cluster_n, 1), :);

