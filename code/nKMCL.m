function [ v,dlist ] = nKMCL( x,ulower,uupper,r)
import IT2FCM.*;
e=1;
l=1;
L=20;
dlist=zeros(L,1);
[n,m,sam]=size(x);
u=(ulower+uupper)/2;
[c,~]=size(u);
v1=Utility.GetCenter(x,u,r);
v2=v1;
while(l<=L)
 for q=1:sam
    for i=1:m
        for j=1:c
            for k = 1:n
               
                if(x(k,i,q)<=v1(j,i,q))
                    u(j,k)=uupper(j,k);
                else
                    u(j,k)=ulower(j,k);
                end
                
            end
        end
        v2(:,i,q)=Utility.GetCenter(x(:,i,q),u,r);
     end

    d = sum(sum(abs(v1(:,:,q)-v2(:,:,q))));
    dlist(l)=d;
    if(d<e)
        v(:,:,q)=v2(:,:,q);
       break
    else
         v1(:,:,q)=v2(:,:,q);
    end
 end
end

end

