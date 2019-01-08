classdef Distances
    methods(Static)
        function d = Euclidean(left,right)
            t=left-right;
            d=sum(sqrt(sum(t.*t)));
        end
        function d = Hamming(left,right)
            t=left-right;
            d=sum(sqrt(sum(abs(t))));
        end
        function d = Lang(left,right)
            sub=abs(left-right);
            add=abs(left+right);
            d=sum(sum(sub./add));
        end
        function d  = Chebyshev(left,right)
            d=max(max(abs(left-right)));
        end
        function d = Mahalanobis(left,right)
            m=size(left,2);
            v=zeros(m,m);
            ml=mean(left);
            mr=mean(right);
            for i=1:m
                for j=1:m
                    v(i,j)= ((left-ml)*(right-mr)')/(m-1);
                end
            end
            d = (left-right)*v\(left-right)';
        end
    end
end