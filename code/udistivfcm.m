% �Ӻ���
function uout = udistivfcm(center,ddown,dup)
% function mout = mdistivfcm(center, meana,stda,data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   uout        ---- ����
%ŷ�Ͼ���
data1=ddown;
data2=dup;
uout = zeros(size(center, 1), size(data1, 1));
 for k = 1:size(center, 1) % ��ÿһ����������
% % % % %     % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�1���������� )
% % % % 
% % % %      out(k, :) = max(abs(sqrt(sum(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1))),abs(sqrt(sum(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1))));
% % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�2���������� )
% % % % out(k, :) = max(abs(sqrt(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1)),abs(sqrt(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1)));
% % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�4���������� ):��������׹�ʽ
%  uout(k, :) =sum( max(abs(data1-ones(size(data,1),1)*center(k,:,1)),abs(data2-ones(size(data,1),1)*center(k,:,2)))',1);
% % % % % �������������ţΣ�        
% % % % % 
% % % % % % ======ŷʽ���빫ʽ
 uout(k, :)=abs(sqrt(sum(((data1-ones(size(data1,1),1)*center(k,:,1)).^2)',1)+sum(((data2-ones(size(data1,1),1)*center(k,:,2)).^2)',1)));
% % % % % %======ŷʽ����END
end