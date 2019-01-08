function [ result,ve,mm,dlist ] = T1FCM( x,vs,dis,r)
e=1e-5;
L=20;
l=1;
dlist=zeros(L,1);
import IT2FCM.*;
v1=vs;
while(l<=L)
    mm=Utility.MembershipMatrix(v1,x,dis,r);
    v2=Utility.GetCenter(x,mm,r);
    dtmp=sum(sum((v1-v2).^2,2))/size(vs,1);
%     dtmp=Utility.DistanceMatrix(v1,v2,dis)
    dlist(l)=dtmp;
    if(dtmp<e) 
        break;
    else
        v1=v2;
        l=l+1;   
    end
end
ve=v2;
result=HardPartition(ve,x,dis);


