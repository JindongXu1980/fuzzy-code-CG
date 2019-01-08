function [ v,dlist] = KMCR( x,ulower,uupper,r)
import IT2FCM.*;
% r=3;
e=1;
l=1;
L=20;
dlist=zeros(L,1);
[n,m]=size(x);
u=(ulower+uupper)/2;
[c,~]=size(u);
v1=Utility.GetCenter(x,u,r);
v2=v1;
while(l<=L)
    for i=1:m
        for j=1:c
            for k = 1:n
                if(x(k,i)>=v1(j,i))
                    u(j,k)=uupper(j,k);
                else
                    u(j,k)=ulower(j,k);
                end
            end
        end        
        v2(:,i)=Utility.GetCenter(x(:,i),u,r);
    end
    d = sum(sum(abs(v1-v2)));
    dlist(l)=d;
    if(d<e)
        v=v2;
        break
    else
        v1=v2;
    end
end
end

