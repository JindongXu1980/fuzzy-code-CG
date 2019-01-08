function [U_new, center, obj_fcn] = stepaivfcm(ddown,dup, U, cluster_n, expo)


mf = U.^expo;       % MF matrix after exponential modification
center=zeros(cluster_n,size(ddown, 2),2);
% center=zeros(cluster_n,1,2);
[m,n]=size(ddown);

%======区间数据构造法1
% data1=0.85.*data;
% data2=1.15.*data;
% c1= mf*data1./((ones(size(data1, 2), 1)*sum(mf'))'); % new center
% c2=mf*data2./((ones(size(data1, 2), 1)*sum(mf'))'); % new center
%=============END
%======区间数据构造法2
% c1= mf*data(:,:,1)./((ones(size(data(:,:,1), 2), 1)*sum(mf'))'); % new center
% c2= mf*data(:,:,2)./((ones(size(data(:,:,2), 2), 1)*sum(mf'))'); % new center
%=============END
%======区间数据构造法3
% [x,y]=size(data);
% meana=zeros(m,n);
% stda=zeros(m,n);
% for i=1:m
% meana(i,:)=mean(data(i,:));
% stda(i,:)=std(data(i,:));
% end
data1=ddown;
data2=dup;

% ((ones(size(data, 2), 1)*
c1= mf*data1./((ones(size(data1(:,:,1), 2), 1)*sum(mf'))'); % new center
c2=mf*data2./((ones(size(data1(:,:,1), 2), 1)*sum(mf'))'); % new center
% ==============END
%======区间数据构造法4
% R = exp( -0.5*((data-mean(mean(data)))/std(std(data))).^2);
% R = exp( -0.5*((data-mean(mean(data))).^2)/var(var(data)));
% data1 =  R.^2;
% data2 = R.^0.5;
% [m,n] = size(I(:,:,1));
% B1(:,:) =abs(reshape(data2(:,1),m,n));
% mean1=mean(data1,1);
% mean2=mean(data2,1);
% std1=var(data1,1);
% std2=var(data2,1);
% for k=1:cluster_n
%     center(k,:,1)=mean1+std1*(2*(k-1)/(cluster_n-1)-1);
%     center(k,:,2)=mean2+std2*(2*(k-1)/(cluster_n-1)-1);
% c1= mf*data1./((ones(size(data, 2), 1)*sum(mf'))'); % new center
% c2= mf*data2./((ones(size(data, 2), 1)*sum(mf'))'); % new center
%=============END
center(:,:,1) = c1; % new center
center(:,:,2) =c2; % new center
% dist = distivfcm(center, data);       % fill the distance matrix
 dist=mydistivfcm(center,ddown,dup);
obj_fcn = sum(sum((dist.^2).*mf));  % objective function
tmp = dist.^(-2/(expo-1));      % calculate new U, suppose expo != 1
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));
