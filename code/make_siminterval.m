%======区间数据构造法4:假定每个已知的值为区间的均值
% t=2.0*std(data);
function [ddown,dup,dinterval]=make_siminterval(data)
[m,n]=size(data); 
dinterval= zeros(m,n,2);
t=1.5*std(data)*0.1;
t3 =1.0;
% t=2.0*std(data)*0.1;
t1=ones(size(data,1),1);
stda=ones(size(data,1),1)*t;
ddown=data-t3*stda;
for i=1:m
    for j=1:n
     % data1(i,j)=data(i,j)-stda(i,j)
      if(ddown(i,j)<0)
          ddown(i,j)=0;       
      end
    end
end
dup=data+stda;
dinterval(:,:,1)=ddown;
dinterval(:,:,2)=dup;