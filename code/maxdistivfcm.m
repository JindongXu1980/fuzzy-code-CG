% �Ӻ���
function maxout = maxdistivfcm(center,ddown,dup)
% function mout = mdistivfcm(center, meana,stda,data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   uout        ---- ����
%����ֵ����
data1=ddown;
data2=dup;
% [p q]=size(data1);
maxout = zeros(size(center, 1), size(data1, 1));
 for k = 1:size(center, 1) % ��ÿһ����������
% % % % %     % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�1���������� )
% % % % 
% % % %      maxout(k, :) = max(abs(sqrt(sum(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1))),abs(sqrt(sum(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1))));
% % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�2���������� )
% % % % out(k, :) = max(abs(sqrt(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1)),abs(sqrt(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1)));
% % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�4���������� ):��������׹�ʽ
 maxout(k, :)=sum( max(abs(data1-ones(size(data1,1),1)*center(k,:,1)),abs(data2-ones(size(data1,1),1)*center(k,:,2)))',1);%��ά�����ۼ�
% �����붨��
% maxout(k, :)=10.* max( max(abs(data1-ones(size(data1,1),1)*center(k,:,1)),abs(data2-ones(size(data1,1),1)*center(k,:,2)))');%��ά�������ֵ
% % % % % �������������ţΣ�        

end