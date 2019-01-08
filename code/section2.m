function [seca,secb,means]=section2(data)
[m,n,k]=size(data);
seca=zeros(m,n,k);
secb=zeros(m,n,k);
% t1=ones(size(data,1),1);
% t2=1.0*std(data)*0.1;%调整约束系数
% I=nlfilter(data,[3 3],@(x)sqrt(mse(x)));
for i=1:k
means(:,:,i)=nlfilter(data(:,:,i),[3 3],@(x) mean(mean(x)));
% % I=nlfilter(data,[3 3],@(x) sqrt(mse(x)));
x=1.0*means(:,:,i)*0.1;
data1=double(data(:,:,i));
seca(:,:,i)=data1-x;

seca(:,:,i)=seca(:,:,i);
secb(:,:,i)=data1+x;
end
for i=1:400
    for j=1:400
        if(seca(i,j)<0)
            seca(i,j)=0;
        end
    end
end