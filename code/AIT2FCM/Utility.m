classdef Utility
    methods(Static)
        
        function distanceMatrix = DistanceMatrix(center,x,distance)
            distanceMatrix = pdist2(x,center,distance)';
        end
        
        function membershipMatrix = MembershipMatrix1(distanceMatrix,r)
            [c,n]=size(distanceMatrix);
            membershipMatrix=zeros(c,n);
            p=2/(r-1);
            [row2,col2]=find(isnan(distanceMatrix));
            zs2 = size(row2);
            for j=1:zs2
                distanceMatrix(row2(j),col2(j))=1;
            end
            [row,col]=find(distanceMatrix==0);            
            dp=1./(distanceMatrix.^p);
            dsum=sum(dp);
            for j=1:n
                membershipMatrix(:,j)=dp(:,j)./dsum(j);
            end
            zs = size(row);            
            for j=1:zs
                membershipMatrix(:,col(j)) = zeros(c,1);
                membershipMatrix(row(j),col(j))=1;
            end
        end
        
        function center = GetCenter(x,u,r)
            [n,m]=size(x);
            ur=u.^r;
            center = (ur*x)./(ur*ones(n,m));
        end
        
        function membershipMatrix = MembershipMatrix(center,x,distance,r)
%             import IT2FCM.*;
            distanceMatrix=Utility.DistanceMatrix(center,x,distance);
            membershipMatrix=Utility.MembershipMatrix1(distanceMatrix,r);
        end
        
        
        
         
        
    end    
end

