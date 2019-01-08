function [U_new,a]=changeait2fm_2(ulow,uup,U,udata,a)
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
      index6 = (find(U(6,:) == maxU))';
      index7 = (find(U(7,:) == maxU))';
      index8 = (find(U(8,:) == maxU))';
      index9 = (find(U(9,:) == maxU))';
      index10 = (find(U(10,:) == maxU))';
      index11 = (find(U(11,:) == maxU))';
      index12 = (find(U(12,:) == maxU))';
      





U_new(:,index1')=ulow(:,index1')-(ulow(:,index1')-uup(:,index1'))*a(1);
U_new(:,index2')=ulow(:,index2')-(ulow(:,index2')-uup(:,index2'))*a(2);
U_new(:,index3')=ulow(:,index3')-(ulow(:,index3')-uup(:,index3'))*a(3);
U_new(:,index4')=ulow(:,index4')-(ulow(:,index4')-uup(:,index4'))*a(4);
U_new(:,index5')=ulow(:,index5')-(ulow(:,index5')-uup(:,index5'))*a(5);
U_new(:,index6')=ulow(:,index6')-(ulow(:,index6')-uup(:,index6'))*a(6);
U_new(:,index7')=ulow(:,index7')-(ulow(:,index7')-uup(:,index7'))*a(7);
U_new(:,index8')=ulow(:,index8')-(ulow(:,index8')-uup(:,index8'))*a(8);
U_new(:,index9')=ulow(:,index9')-(ulow(:,index9')-uup(:,index9'))*a(9);
U_new(:,index10')=ulow(:,index10')-(ulow(:,index10')-uup(:,index10'))*a(10);
U_new(:,index11')=ulow(:,index11')-(ulow(:,index11')-uup(:,index11'))*a(11);
U_new(:,index12')=ulow(:,index12')-(ulow(:,index12')-uup(:,index12'))*a(12);

end