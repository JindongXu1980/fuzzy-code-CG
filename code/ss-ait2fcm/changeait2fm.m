function [U_new]=changeait2fm(ulow,uup,U,udata,center1,expo,ii)
data=udata(:,1:3);
%  U=(ulow+uup)./2;
% U=mdistfcm(center1,data);
% U_new=zeros(size(U));
maxU=max(U);

index1 = (find(U(1,:) == maxU))';
      index2 = (find(U(2,:) == maxU))';
      index3 = (find(U(3,:) == maxU))';
      index4 = (find(U(4,:) == maxU))';
      index5 = (find(U(5,:) == maxU))';
%       index6 = (find(U(6,:) == maxU))';
qiwang1=sum(data(index1,:))./size(index1,1);
qiwang2=sum(data(index2,:))./size(index2,1);
qiwang3=sum(data(index3,:))./size(index3,1);
qiwang4=sum(data(index4,:))./size(index4,1);
qiwang5=sum(data(index5,:))./size(index5,1);
% qiwang6=sum(data(index6,:))./size(index6,1);

% qiwang1=center1(1,:);
% qiwang2=center1(2,:);
% qiwang3=center1(3,:);
% qiwang4=center1(4,:);
% qiwang5=center1(5,:);




piancha1=data(index1,:)-ones(size(index1,1),1)*qiwang1;
piancha2=data(index2,:)-ones(size(index2,1),1)*qiwang2;
piancha3=data(index3,:)-ones(size(index3,1),1)*qiwang3;
piancha4=data(index4,:)-ones(size(index4,1),1)*qiwang4;
piancha5=data(index5,:)-ones(size(index5,1),1)*qiwang5;
% piancha6=data(index6,:)-ones(size(index6,1),1)*qiwang6;

% fangcha1=sum(piancha1.^2,2)/size(index1,1);
% fangcha2=sum(piancha2.^2,2)/size(index2,1);
% fangcha3=sum(piancha3.^2,2)/size(index3,1);
% fangcha4=sum(piancha4.^2,2)/size(index4,1);
% fangcha5=sum(piancha5.^2,2)/size(index5,1);
% fangcha6=sum(piancha6.^2,2)/size(index6,1);

% junfangwucha1=sum(abs(piancha1),2)+fangcha1;
% junfangwucha2=sum(abs(piancha2),2)+fangcha2;
% junfangwucha3=sum(abs(piancha3),2)+fangcha3;
% junfangwucha4=sum(abs(piancha4),2)+fangcha4;
% junfangwucha5=sum(abs(piancha5),2)+fangcha5;
% junfangwucha6=sum(abs(piancha6),2)+fangcha6;
% 
% junfangwucha1=fangcha1;
% junfangwucha2=fangcha2;
% junfangwucha3=fangcha3;
% junfangwucha4=fangcha4;
% junfangwucha5=fangcha5;

% junfangwucha1=piancha1;
% junfangwucha2=piancha2;
% junfangwucha3=piancha3;
% junfangwucha4=piancha4;
% junfangwucha5=piancha5;

junfangwucha1=sum(abs(piancha1),2);
junfangwucha2=sum(abs(piancha2),2);
junfangwucha3=sum(abs(piancha3),2);
junfangwucha4=sum(abs(piancha4),2);
junfangwucha5=sum(abs(piancha5),2);
% junfangwucha6=sum(abs(piancha6),2);
% 
% junfangwucha1=sum(piancha1,2)+fangcha1;
% junfangwucha2=sum(piancha2,2)+fangcha2;
% junfangwucha3=sum(piancha3,2)+fangcha3;
% junfangwucha4=sum(piancha4,2)+fangcha4;
% junfangwucha5=sum(piancha5,2)+fangcha5;
% junfangwucha6=sum(abs(piancha6),2)+fangcha6;

e(1)=sum((U(1,index1').^expo)*junfangwucha1)/size(index1,1);
e(2)=sum((U(1,index2').^expo)*junfangwucha2)/size(index2,1);
e(3)=sum((U(1,index3').^expo)*junfangwucha3)/size(index3,1);
e(4)=sum((U(1,index4').^expo)*junfangwucha4)/size(index4,1);
e(5)=sum((U(1,index5').^expo)*junfangwucha5)/size(index5,1);
% e(6)=sum((U(1,index6').^expo)*junfangwucha6)/size(index6,1);
% for i=1:3
% x(:,i)=reshape(I(:,:,i),400*400,1);
% end

% e=abs(e)./5;
% a=1-0.97*exp(-5*(sum(e./5)^2));
% plot(ii,a,'o');
% hold on;
% U_new=ulow-(ulow-uup)*a;


a=1-0.97*exp(-5*((e(1))^2));
plot(ii,a,'.');
hold on;
U_new(:,index1')=ulow(:,index1')-(ulow(:,index1')-uup(:,index1'))*a;


a=1-0.97*exp(-5*((e(2))^2));
plot(ii,a,'o');
hold on;
U_new(:,index2')=ulow(:,index2')-(ulow(:,index2')-uup(:,index2'))*a;

a=1-0.97*exp(-5*((e(3))^2));
plot(ii,a,'+');
hold on;
U_new(:,index3')=ulow(:,index3')-(ulow(:,index3')-uup(:,index3'))*a;

a=1-0.97*exp(-5*((e(4))^2));
plot(ii,a,'*');
hold on;
U_new(:,index4')=ulow(:,index4')-(ulow(:,index4')-uup(:,index4'))*a;

a=1-0.97*exp(-5*((e(5))^2));
plot(ii,a,'v');
hold on;
U_new(:,index5')=ulow(:,index5')-(ulow(:,index5')-uup(:,index5'))*a;

% a=1-0.97*exp(-1.5*(e(6)^2));
% plot(ii,a,'d');
% hold on;
% U_new(:,index6')=ulow(:,index6')-(ulow(:,index6')-uup(:,index6'))*a;
% data1=double(data);
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