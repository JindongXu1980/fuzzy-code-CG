% �Ӻ���
function U = initivfcm(cluster_n, data_n)
% ��ʼ��fcm�������Ⱥ�������
% ����:
%   cluster_n   ---- �������ĸ���
%   data_n      ---- ��������
% �����
%   U           ---- ��ʼ���������Ⱦ���
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