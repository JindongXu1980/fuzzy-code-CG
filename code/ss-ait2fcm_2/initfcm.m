function [U_u,U_l,center] = initfcm(cluster_n,udata,ldata,udata_n,ldata_n,label,expo)


U_u = zeros(cluster_n, udata_n);
U_l=zeros(cluster_n,ldata_n);

for j=1:ldata_n
    for i=1:cluster_n
        if i==label(j,1);
            U_l(i,j)=1;
        end
    end
end

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
Ldata=ldata(:,1:3);
% mf_u = U_u.^expo;      
mf_l = U_l.^expo;
% center = mf_u*Udata./(sum(mf_u,2)*ones(1,size(Udata,2))); %new center
% center = (mf_l*Ldata./(sum(mf_l,2)*ones(1,size(Ldata,2))));
index1=find(label(:,1)==1);
index2=find(label(:,1)==2);
index3=find(label(:,1)==3);
index4=find(label(:,1)==4);
index5=find(label(:,1)==5);
index6=find(label(:,1)==6);

% center(1,:)=sum(Ldata(index1,:))./size(index1,1);
% center(2,:)=sum(Ldata(index2,:))./size(index2,1);
% center(3,:)=sum(Ldata(index3,:))./size(index3,1);
% center(4,:)=sum(Ldata(index4,:))./size(index4,1);
% center(5,:)=sum(Ldata(index5,:))./size(index5,1);
% center(6,:)=sum(Ldata(index6,:))./size(index6,1);
center=rand(12,3)*255;
dist_u = distfcm(center, Udata);   

tmp = dist_u.^(-2/(expo-1));      
U_u = tmp./(ones(cluster_n, 1)*sum(tmp));
end


