% �Ӻ���
function [U_new, center, obj_fcn] = stepfcm(data, U, cluster_n, expo)
% ģ��C��ֵ����ʱ������һ��
% ���룺
%   data        ---- nxm����,��ʾn������,ÿ����������m��ά����ֵ
%   U           ---- �����Ⱦ���
%   cluster_n   ---- ����,��ʾ�ۺ�������Ŀ,�������
%   expo        ---- �����Ⱦ���U��ָ��                      
% �����
%   U_new       ---- ������������µ������Ⱦ���
%   center      ---- ������������µľ�������
%   obj_fcn     ---- Ŀ�꺯��ֵ
mf = U.^expo;       % �����Ⱦ������ָ��������
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % �¾�������(5.4)ʽ
%  dist = distfcm(center, data);       % ����������
 dist = distfcm(center, data);       % ����������
%  dist = mydistfcm(center, data);
obj_fcn = sum(sum((dist.^2).*mf));  % ����Ŀ�꺯��ֵ (5.1)ʽ
tmp = dist.^(-2/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));  % �����µ������Ⱦ��� (5.3)ʽ