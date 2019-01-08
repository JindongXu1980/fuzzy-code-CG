function [ center, obj_fcn] = stepfcm(udata, U_u, expo)
Udata=udata(:,1:3);

mf_u = U_u.^expo;      

center_u = (mf_u*Udata./(sum(mf_u,2)*ones(1,size(Udata,2)))); %new center

% center_l(isnan(center_l))=0;
center=center_u;
dist_u1 = distfcm(center, Udata);   

% dist_u2 = mdistfcm(center, Udata);   
% dist_l2= mdistfcm(center, Ldata);
dist_u=dist_u1;

obj_fcn =sum(sum((dist_u).*mf_u));  % objective function
% tmp = dist_u.^(-1/(expo-1));      
% U_new = tmp./(ones(cluster_n, 1)*sum(tmp));
