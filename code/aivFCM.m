function [center_new, U, obj_fcn] = aivFCM(data,ddown,dup,center, cluster_n,means)



data_n = size(data, 1); % ���data�ĵ�һά(rows)��,����������
in_n = size(data, 2);   % ���data�ĵڶ�ά(columns)����������ֵ����
% Ĭ�ϲ�������
options = [2.5; % �����Ⱦ���U��ָ��
    500;                % ���������� 
    1e-5;               % ��������С�仯��,������ֹ����
    1];                 % ÿ�ε����Ƿ������Ϣ��־ 


%��options �еķ����ֱ�ֵ���ĸ�����;
expo = options(1);          % �����Ⱦ���U��ָ��
max_iter = options(2);  % ���������� 
min_impro = options(3);  % ��������С�仯��,������ֹ����
display = options(4);  % ÿ�ε����Ƿ������Ϣ��־ 

obj_fcn = zeros(max_iter, 1); % ��ʼ���������obj_fcn


% [ddown,dup,sec,means]=section2(data);


U = initaivfcm(center,ddown,dup,expo);     % ��ʼ��ģ���������,ʹU�����������Ϊ1,



% Main loop  ��Ҫѭ��

for i = 1:max_iter,
    %�ڵ�k��ѭ���иı��������ceneter,�ͷ��亯��U��������ֵ;
%  [U, center, obj_fcn(i)] = jwstepivfcm(ddown,dup, U, cluster_n, expo);
 [U_new, center_new, obj_fcn(i)]=stepaivfcm(ddown,dup, U, cluster_n, expo);
 [ddown,dup]=changeaiv(means,U_new,data,center_new);
 if display, 
  fprintf('FCM:Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
 end
 % ��ֹ�����б�
 if i > 1,
  if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, 
            break;
        end,
 end
end

iter_n = i; % ʵ�ʵ������� 
obj_fcn(iter_n+1:max_iter) = [];