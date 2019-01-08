function [U_u,center] = initfcm(cluster_n,udata,expo)


U_u = zeros(cluster_n, size(udata,1));



% col_sum = sum(U_u);
% U_u = U_u./col_sum(ones(cluster_n, 1), :);

% for i=1:udata_n
%     for j=1:ldata_n
%     if udata(i,:)==ldata(j,:)
% %         first_u=[j;i lable(j,1)];
%         U_u(:,i)=zeros(cluster_n,1);
%         U_u(lable(j,1),i)=1;
%         break;
%     end
%     end
% end


Udata=udata(:,1:3);

% mf_u = U_u.^expo;      

% center = mf_u*Udata./(sum(mf_u,2)*ones(1,size(Udata,2))); %new center
% center = (mf_l*Ldata./(sum(mf_l,2)*ones(1,size(Ldata,2))));

% index6=find(label(:,1)==6);


center=rand(cluster_n,3)*255;
dist_u = distfcm(center, Udata);   
%tmp = dist_u.^(-2/(expo-1));  
tmp = dist_u.^(-2/(expo-1));                  %指数变为3
U_u = tmp./(ones(cluster_n, 1)*sum(tmp));
end


