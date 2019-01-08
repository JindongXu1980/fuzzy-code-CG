% �Ӻ���
function [U_new, center, obj_fcn] = stepfcmnew(data, U, cluster_n,expo,x,mymean,mystd)
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
% [mymean,mystd]=make_mstd(x,data);

mf = U.^expo;       % �����Ⱦ������ָ��������
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % �¾�������(5.4)ʽ
%  dist = distfcm(center, data);       % ����������
%  dist = distfcm(center, data);       % ����������
 dist = mydistfcm(center, data);
obj_fcn = sum(sum((dist.^2).*mf));  % ����Ŀ�꺯��ֵ (5.1)ʽ
tmp = dist.^(-2/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));  % �����µ������Ⱦ��� (5.3)ʽ
% Tmean=mean(mean(data))/255;
% Tstd=std(std(data))/255;
%����������
[m n]=size(U);
pi=3.1415926;
pp=sqrt(2*pi);
a=1.25;
b=1/a;
%����1
UL=U_new.^a;
UR=U_new.^b;
%����1end
%����2
% 
% UL=(1/(pp*Tstd)*exp( -0.5.*(((U_new-Tmean)./Tstd).^2))).^a;
% UR=(1/(pp*Tstd)*exp( -0.5.*(((U_new-Tmean)./Tstd).^2))).^b;

%����2end
%����3
% mymean=mean(mymean');
% mystd=mean(mystd');
% for k=1:cluster_n
% UL(k,:)=(1/(pp*Tstd)*exp( -0.5.*(((U_new(k,:)-mymean)/Tstd).^2))).^a;
% UR(k,:)=(1/(pp*Tstd)*exp( -0.5.*(((U_new(k,:)-mymean)/Tstd).^2))).^b;
% end
a=zeros(1,cluster_n)
for k=1:cluster_n
U_new(k,:) = UR(k,:)-a(k).*2*data.*(UR(k,:)-UL(k,:))
end

%����3end
for i=1:m
    for j=1:n
        if(U_new(i,j)>0.5)
            U_new(i,j)=0.4*UL(i,j)+0.6*UR(i,j);
        else
            U_new(i,j)=0.6*UL(i,j)+0.4*UR(i,j);
        end
    end
end

% t1=mean(mymean');
% t2=std(mystd');

% for i=1:cluster_n
% UL(i,:)=(exp( -0.5.*(((U_new(i)- t1)./t2).^2))./(pp*t2)).^a;
% UR(i,:)=(exp( -0.5.*(((U_new(i)- t1)./t2).^2))./(pp*t2)).^b;
% end
            