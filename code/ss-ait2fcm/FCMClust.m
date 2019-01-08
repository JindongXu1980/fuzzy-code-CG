function [center, U_u,U_l, obj_fcn] = FCMClust(udata,ldata,lable,cluster_n)
% FCMClust.m   ����ģ��C��ֵ�����ݼ�data��Ϊcluster_n�� 
%
% �÷���
%   1.  [center,U,obj_fcn] = FCMClust(Data,N_cluster,options);
%   2.  [center,U,obj_fcn] = FCMClust(Data,N_cluster);
%   
% ���룺
%   data        ---- nxm����,��ʾn������,ÿ����������m��ά����ֵ
%   N_cluster   ---- ����,��ʾ�ۺ�������Ŀ,�������
%   options     ---- 4x1��������
%       options(1):  �����Ⱦ���U��ָ����>1                  (ȱʡֵ: 2.0)
%       options(2):  ����������                           (ȱʡֵ: 100)
%       options(3):  ��������С�仯��,������ֹ����           (ȱʡֵ: 1e-5)
%       options(4):  ÿ�ε����Ƿ������Ϣ��־                (ȱʡֵ: 1)
% �����
%   center      ---- ��������
%   U           ---- �����Ⱦ���
%   obj_fcn     ---- Ŀ�꺯��ֵ
%   Example:
  %     data = rand(100,2);
 %      [center,U,obj_fcn] = FCMClust(data,2);
  %     plot(data(:,1), data(:,2),'o');
 %      hold on;
 %      maxU = max(U);
 %      index1 = find(U(1,:) == maxU);
 %      index2 = find(U(2,:) == maxU);
  %     line(data(index1,1),data(index1,2),'marker','*','color','g');
  %     line(data(index2,1),data(index2,2),'marker','*','color','r');
 %     plot([center([1 2],1)],[center([1 2],2)],'*','color','k')
 %      hold off;
 
udata_n = size(udata, 1); % ���data�ĵ�һά(rows)��,����������
ldata_n=size(ldata,1);
a=ldata_n/(udata_n+ldata_n); 
% in_n = size(udata, 2);   % ���data�ĵڶ�ά(columns)����������ֵ����
% Ĭ�ϲ�������
options = [2.5; % �����Ⱦ���U��ָ��
    100;                % ���������� 
    10^(-5);               % ��������С�仯��,������ֹ����
    1];                 % ÿ�ε����Ƿ������Ϣ��־ 

expo = options(1);          % �����Ⱦ���U��ָ��
max_iter = options(2);  % ���������� 
min_impro = options(3);  % ��������С�仯��,������ֹ����
display = options(4);  % ÿ�ε����Ƿ������Ϣ��־ 

obj_fcn = zeros(max_iter, 1); % ��ʼ���������obj_fcn

[U_u,U_l,center] = initfcm(cluster_n,udata,ldata, udata_n,ldata_n,lable,expo);     % ��ʼ��ģ���������,���ݱ��������ʼ��������
% Main loop  ��Ҫѭ��
for i = 1:max_iter,
   
    [U_ulow,U_uup] = cu(center,cluster_n,udata,expo);        % ������������������������
   
    [U_u]=changeait2fm(U_ulow,U_uup,U_u,udata,center,expo,i);  % ����������������������Ӧ����
%     v2=center;
 [center, obj_fcn(i)] = stepfcm(udata,ldata, U_u,U_l,a,expo);   % ����������
 if display, 
  fprintf('FCM:Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
 end
%  ��ֹ�����б�
 if i > 1,
  if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, 
            break;
  end
        
 end

% d=sum(sum(abs(center-v2)));
% if abs(d)<min_impro
%     break;
% end




end

% iter_n = i; % ʵ�ʵ������� 
% obj_fcn(iter_n+1:max_iter) = [];





% index=zeros(size(udata,1),1);
%  maxU = max(U_u);
%   for i = 1:cluster_n
%       for ii =1:size(udata,1)
%           if(find(U_u(i,ii) == maxU))
%            index(ii,1) =i;
%           end
% %  outc=data(index,:)
%       end
%   end
end
% maxU = max(U);
% for i = 1:cluster_n
% index = find(U(i,:) == maxU);
%  outc=data(index,:)
% end