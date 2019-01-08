classdef IT2FCM
    methods(Static)
function [ result,ve,vl,vr,vt1 ] = Method1( x,vs,dis,r1,r2)
    import IT2FCM.*;
    [~,vt1,~,~]=T1FCM(x,vs,dis,2);    
    u1=Utility.MembershipMatrix(vt1,x,dis,r1);
    u2=Utility.MembershipMatrix(vt1,x,dis,r2);
    ulower=u1.*(u>=1/c)+u2.*(u<=1/c);
    uupper=u1.*(u<1/c)+u2.*(u>=1/c);
    vl=KMCL(x,ulower,uupper,dis);
    vr=KMCR(x,ulower,uupper,dis);
    ve=(vl+vr)/2;
    result=HardPartition(ve,x,dis);
end

function [ result,ve,vl,vr,dlist ] = Method2( x,vs,dis,r,r1,r2)
    import IT2FCM.*;
    v1=vs;
    e=1e-5;
    l=1;L=20;
    dlist=zeros(L,1);
    c=size(vs,1);
    while(l<=L)
        u1=Utility.MembershipMatrix(v1,x,dis,r1);
        u2=Utility.MembershipMatrix(v1,x,dis,r2);
        ulower=min(u1,u2);
        uupper=max(u1,u2);
        vl=KMCL(x,ulower,uupper,r);
        vr=KMCR(x,ulower,uupper,r);
        v2=(vl+vr)/2;
        d=sum(sum(abs(v1-v2)));
        if(d>e)
            dlist(l)=d;
            v1=v2;
            l=l+1
        else
            break;
        end
    end
    ve=v2;
    ve=sortrows(ve);
    result=HardPartition(ve,x,dis);
end
function [ result,ve,vl,vr,dlist ] = Method3( x,vs,dis,r,r1,r2)
    import IT2FCM.*;
    v1=vs;
    e=1e-5;
    l=1;L=20;
    dlist=zeros(L,1);
    c=size(vs,1);
    [n,m]=size(x);
    while(l<=L)
        u1=Utility.MembershipMatrix(v1,x,dis,r1);
        u2=Utility.MembershipMatrix(v1,x,dis,r2);
        u=Utility.MembershipMatrix(v1,x,dis,3);
        ulower=u2.*(u>=1/c)+u1.*(u<1/c);
        uupper=u2.*(u<1/c)+u1.*(u>=1/c);
%         ulower=min(u1,u2);
%         uupper=max(u1,u2);
        vl=KMCL(x,ulower,uupper,1);
        vr=KMCR(x,ulower,uupper,1);
        ul=zeros(c,n);
        ur=zeros(c,n);
        for i=1:m
            for j=1:c
                for k = 1:n
                    if(x(k,i)>=v1(j,i))
                        ur(j,k)=ur(j,k)+uupper(j,k);
                        ul(j,k)=ul(j,k)+ulower(j,k);
                    else
                        ur(j,k)=ur(j,k)+ulower(j,k);
                        ul(j,k)=ul(j,k)+uupper(j,k);
                    end
                end
            end
        end
        u=(ul+ur)/2/m;
        v2=Utility.GetCenter(x,u,r);
%         d=dis(v1,v2);
        d=sum(sum(abs(v1-v2)));
        if(d>e)
            dlist(l)=d;
            v1=v2;
            l=l+1;
        else
            break;
        end
    end
    ve=v2;
    result=HardPartition(ve,x,dis);
end
function [ result,ve,dlist ] = Method4(x,vs,dis1,dis2,r)
    import IT2FCM.*;
    v1=vs;
    e=0.001;
    l=1;L=300;
    dlist=zeros(L,1);
    c=size(vs,1);
    while(l<=L)
        ulower=Utility.MembershipMatrix(v1,x,dis1,r);
        uupper=Utility.MembershipMatrix(v1,x,dis2,r);
        u=changeait2fm(ulower,uupper,x,v1,l);
        v2=u*x./((ones(size(x,2),1)*sum(u'))');
        d=sum(sum(abs(v1-v2)));
        if(d>e)
            dlist(l)=d;
            v1=v2;
            l=l+1;
        else
            break;
        end
       
    end
    ll=l;
    ve=v2;
    ve=sortrows(ve);
    result=HardPartition(ve,x,dis1);
end
end
end

