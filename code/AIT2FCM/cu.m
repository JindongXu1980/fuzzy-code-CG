function [U_ulow,U_uup] = cu(center,cluster_n,udata,expo)

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
% % Ldata=ldata(:,1:3);
% mf_u = U_u.^expo;      
% % mf_l = U_l.^expo;
% center = mf_u*Udata./(sum(mf_u,2)*ones(1,size(Udata,2))); %new center
% % center_l = a*(mf_l*Ldata./(sum(mf_l,2)*ones(1,size(Ldata,2))));
% dist_ulow = dist_means(center, Udata); 
% dist_uup = dist_max(center, Udata); 
dist_ulow = dist_means(center, Udata); 
dist_uup = dist_max(center, Udata); 
% tmp_low = dist_ulow.^(-2/(expo-1));      
tmp_low = dist_ulow.^(-2/(expo-1));    
U_ulow = tmp_low./(ones(cluster_n, 1)*sum(tmp_low));
% tmp_up = dist_uup.^(-2/(expo-1)); 
tmp_up = dist_uup.^(-2/(expo-1));
U_uup = tmp_up./(ones(cluster_n, 1)*sum(tmp_up));
end


