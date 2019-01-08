function [ddown_new,dup_new]=changeaiv(x,U,data,center,ii)
maxU=max(U);
ddown_new=zeros(size(data));
dup_new=zeros(size(data));
index1 = (find(U(1,:) == maxU))';
      index2 = (find(U(2,:) == maxU))';
      index3 = (find(U(3,:) == maxU))';
      index4 = (find(U(4,:) == maxU))';
      index5 = (find(U(5,:) == maxU))';
%       index6 = (find(U(6,:) == maxU))';
center1=(center(:,:,1)+center(:,:,2))/2;

piancha1=abs(data(index1,:)-ones(size(index1,1),1)*center1(1,:));
piancha2=abs(data(index2,:)-ones(size(index2,1),1)*center1(2,:));
piancha3=abs(data(index3,:)-ones(size(index3,1),1)*center1(3,:));
piancha4=abs(data(index4,:)-ones(size(index4,1),1)*center1(4,:));
piancha5=abs(data(index5,:)-ones(size(index5,1),1)*center1(5,:));
% piancha6=data(index6,:)-ones(size(index6,1),1)*center1(6,:);

e(1)=sum(U(1,index1')*piancha1)/size(index1,1);
e(2)=sum(U(1,index2')*piancha2)/size(index2,1);
e(3)=sum(U(1,index3')*piancha3)/size(index3,1);
e(4)=sum(U(1,index4')*piancha4)/size(index4,1);
e(5)=sum(U(1,index5')*piancha5)/size(index5,1);
% e(6)=sum(U(1,index6')*piancha6)/size(index6,1);
% for i=1:3
% x(:,i)=reshape(I(:,:,i),400*400,1);
% end
a=1-0.99*exp(-1.5*(e(1)^2));
plot(ii,a,'.');
hold on;
% data1=double(data);
ddown_new(index1,:)=data(index1,:)-x(index1,:)*a;
ddown_new(index1,:)=uint8(ddown_new(index1,:));
dup_new(index1,:)=uint8(data(index1,:)+x(index1,:).*a);

a=1-0.99*exp(-1.5*(e(2)^2));
plot(ii,a,'o');
hold on;
% data1=double(data);
ddown_new(index2,:)=data(index2,:)-x(index2,:)*a;
ddown_new(index2,:)=uint8(ddown_new(index2,:));
dup_new(index2,:)=uint8(data(index2,:)+x(index2,:).*a);

a=1-0.99*exp(-1.5*(e(3)^2));
plot(ii,a,'+');
hold on;
% data1=double(data);
ddown_new(index3,:)=data(index3,:)-x(index3,:)*a;
ddown_new(index3,:)=uint8(ddown_new(index3,:));
dup_new(index3,:)=uint8(data(index3,:)+x(index3,:).*a);

a=1-0.99*exp(-1.5*(e(4)^2));
plot(ii,a,'*');
hold on;
% data1=double(data);
ddown_new(index4,:)=data(index4,:)-x(index4,:)*a;
ddown_new(index4,:)=uint8(ddown_new(index4,:));
dup_new(index4,:)=uint8(data(index4,:)+x(index4,:).*a);

a=1-0.99*exp(-1.5*(e(5)^2));
plot(ii,a,'v');
hold on;
% data1=double(data);
ddown_new(index5,:)=data(index5,:)-x(index5,:)*a;
ddown_new(index5,:)=uint8(ddown_new(index5,:));
dup_new(index5,:)=uint8(data(index5,:)+x(index5,:).*a);

% a=1-0.99*exp(-1.5*(e(6)^2));
% plot(ii,a,'d');
% hold on;
% % data1=double(data);
% ddown_new(index6,:)=data(index6,:)-x(index6,:)*a;
% ddown_new(index6,:)=uint8(ddown_new(index6,:));
% dup_new(index6,:)=uint8(data(index6,:)+x(index6,:).*a);

% [m,n]=size(data);
% for k=1:3
% for i=1:m
%     for j=1:n
%         if(ddown_new(i,j,k)<0)
%             ddown_new(i,j,k)=0;
%         end
%     end
% end
end
