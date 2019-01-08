%主函数
%   [I,data] =Mread();
%    [I,data] =myLread();
[I,data] = Mread();
%[new_vectors,ddown,dup,dcom]=make_oointerval(I,data);
[m,n,sam] = size(I);
cluster_num=6;
%dmean=(ddown+dup)/2;
[t2t,t2v,vl,vr,dlist] = IT2FCM.Method2(data,rand(cluster_num,sam)*255,'mahalanobis',3,2.5,5.5);
% center=rand(cluster_num,sam,2)*255;
% [t2t,t2v,vl,vr,dlist] = IT2FCM.IT2FCM.Method2(x,center,'mahalanobis',3,2,10);
       
B2=zeros(m,n);
B2(:,:) =abs(reshape(t2t(:,1),m,n));

clims = [ 1 cluster_num ];
figure,imagesc(B2,clims);
colormap(jet)
figure,imshow(B2,[1 cluster_num]);
conNUM=3;

map2=zeros(cluster_num,conNUM);
for i=1:cluster_num
    for j=1:conNUM
    map2(i,j)=i/(1.0*cluster_num);
    end
end
colormap(map2);
% imwrite(B2,map2,'E:\E\重要备份\区间\毕业设计贺辉\fcm\0911\resultsComparison\ivt2gdsub0813123c60903255.bmp');