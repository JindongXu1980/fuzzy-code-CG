function out = mdistfcm(center, data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   out        ---- ����
%���Ͼ���
c=cov(data);
d = mahalanobis(data, center, c);
out=d';
%====END