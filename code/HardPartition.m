function [ result ] = HardPartition( center,x,dis )
import IT2FCM.*;
[n,~]=size(x);
result=zeros(n,1);
d=Utility.DistanceMatrix(center,x,dis);
mind=min(d);
for i=1:n
    result(i)=find(d(:,i)==mind(i),1);
end
end

