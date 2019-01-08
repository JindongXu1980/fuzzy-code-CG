function u=initaivfcm(center,ddown,dup,expo)
% u=zeros(size(ddown,1),size(center,1));
dist=mydistivfcm(center,ddown,dup);
tmp = dist.^(-2/(expo-1));      % calculate new U, suppose expo != 1
u = tmp./(ones(6, 1)*sum(tmp));