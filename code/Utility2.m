classdef Utility2
    methods(Static)
        
        function distanceMatrix = DistanceMatrix(center,x,distanceFunction)
            [n,~] = size(x);
            [c,~] = size(center);
            distanceMatrix=zeros(c,n);
            for i=1:c
                for j=1:n
                    distanceMatrix(i,j)=distanceFunction(center(i,:),x(j,:));
                end
            end
        end
        
        function membershipMatrix = MembershipMatrix1(distanceMatrix,r)
            [c,n]=size(distanceMatrix);
            membershipMatrix=zeros(c,n);
            p=2/(r-1);
            dp=1./(distanceMatrix.^p);
            dsum=sum(dp);
            for j=1:n
                membershipMatrix(:,j)=dp(:,j)./dsum(j);
            end
        end
        
        function center = GetCenter(x,u,r)
            [n,m]=size(x);
            ur=u.^r;
            center = (ur*x)./(ur*ones(n,m));
        end
        
        function membershipMatrix = MembershipMatrix(center,x,distanceFunction,r)
            distanceMatrix=IT2FCM.Utility.DistanceMatrix(center,x,distanceFunction);
            membershipMatrix=IT2FCM.Utility.MembershipMatrix1(distanceMatrix,r);
        end
        
    end    
end

