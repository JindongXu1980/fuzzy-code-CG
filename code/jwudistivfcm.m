function uout = jwudistivfcm(center,ddown,dup)
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
t1=ones(size(data1,1),1)*center(:,1)';
t2=ones(size(data1,1),1)*center(:,2)';
t11=center(:,1);
t21=center(:,2);
d1=pdist2(data1,t11);
d2=pdist2(data2,t21);
uout=d1+d2;
%  for k = 1:size(center, 1) % ��ÿһ����������
% % % % % %     % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�1���������� )
% % % % % 
% % % % %      out(k, :) = max(abs(sqrt(sum(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1))),abs(sqrt(sum(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1))));
% % % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�2���������� )
% % % % % out(k, :) = max(abs(sqrt(((data1-ones(size(data,1),1)*center(k,:,1)).^2)',1)),abs(sqrt(((data2-ones(size(data,1),1)*center(k,:,2)).^2)',1)));
% % % % % % %        % ÿһ��ѭ��������������㵽һ���������ĵľ���(���շ�4���������� ):��������׹�ʽ
% %  uout(k, :) =sum( max(abs(data1-ones(size(data,1),1)*center(k,:,1)),abs(data2-ones(size(data,1),1)*center(k,:,2)))',1);
% % % % % % �������������ţΣ�        
% % % % % % 
% % % % % % % ======ŷʽ���빫ʽ
% t1=ones(size(data1,1),1)*center(k,1);
% t2=ones(size(data1,1),1)*center(k,2);
% uout(k, :)=abs(sqrt((data1-t1).^2+(data2-t2).^2));
% % % % % % %======ŷʽ����END
% end