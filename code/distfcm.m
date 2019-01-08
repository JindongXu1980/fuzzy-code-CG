% �Ӻ���
function out = distfcm(center, data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   out        ---- ����


% The Euclidean distance d between two vectors X and Y is: 
% d = sqrt(sum((x-y).^2))

%���Ͼ���
% c=cov(data);
% d = mahalanobis(data, center, c);
% out=d';
%====END
out = zeros(size(center, 1), size(data, 1));
for k = 1:size(center, 1), % ��ÿһ����������
%     % ÿһ��ѭ��������������㵽һ���������ĵľ���
    out(k, :) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
    
end