% �Ӻ���
function out = mydistfcm(center, data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   out        ---- ����
% out1=mdistfcm(center, data);
 out2=udistfcm(center, data);
% out=0.6*out1+0.4*out2;
out=out2;
