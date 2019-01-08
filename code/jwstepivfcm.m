function [U_new, center, obj_fcn] = jwstepivfcm(ddown,dup, U, cluster_n, expo)
%STEPFCM One step in fuzzy c-mean clustering.
%   [U_NEW, CENTER, ERR] = STEPFCM(DATA, U, CLUSTER_N, EXPO)
%   performs one iteration of fuzzy c-mean clustering, where
%
%   DATA: matrix of data to be clustered. (Each row is a data point.)
%   U: partition matrix. (U(i,j) is the MF value of data j in cluster j.)
%   CLUSTER_N: number of clusters.
%   EXPO: exponent (> 1) for the partition matrix.
%   U_NEW: new partition matrix.1,
%   CENTER: center of clusters. (Each row is a center.)
%   ERR: objective function for partition U.
%
%   Note that the situation of "singularity" (one of the data points is
%   exactly the same as one of the cluster centers) is not checked.
%   However, it hardly occurs in practice.
%
%       See also DISTFCM, INITFCM, IRISFCM, FCMDEMO, FCM.

%   Roger Jang, 11-22-94.
%   Copyright 1994-2002 The MathWorks, Inc. 
%   $Revision: 1.13 $  $Date: 2002/04/14 22:21:02 $

mf = U.^expo;       % MF matrix after exponential modification
center=zeros(cluster_n,2);
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
c1= mf*data1./((ones(size(data1, 2), 1)*sum(mf'))'); % new center
c2= mf*data2./((ones(size(data1, 2), 1)*sum(mf'))'); % new center
%=============END
center(:,1) = c1; % new center
center(:,2) =c2; % new center
% dist = distivfcm(center, data);       % fill the distance matrix
 dist=mydistivfcm(center,ddown,dup);
obj_fcn = sum(sum((dist.^2).*mf'));  % objective function
tmp = dist'.^(-2/(expo-1));      % calculate new U, suppose expo != 1
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));
