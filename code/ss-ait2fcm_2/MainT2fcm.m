%主函数
%   [I,data] =Mread();
%    [I,data] =myLread();
clear;
[I,data] = data_Mread();
data=data(:,1:3);
% [new_vectors,ddown,dup,dcom]=make_oointerval(I,data);
% [~,~,B] = make_neiinterval(I,data)
[m,n,sam] = size(I);
cluster_num=5;
%dmean=(ddown+dup)/2;
[t2t,t2v,vl,vr,dlist] = IT2FCM.Method2(data,rand(cluster_num,sam)*255,'euclidean',3,1.5,4.5);
% [t2t,t2v,vl,vr,dlist] = IT2FCM.Method3(data,rand(cluster_num,sam)*255,'mahalanobis',3,2,10);
% [t2t,t2v,dlist] = IT2FCM.Method4(data,rand(cluster_num,sam)*255,'mahalanobis','euclidean',2);
% center=rand(cluster_num,sam,2)*255;
% [t2t,t2v,vl,vr,dlist] = IT2FCM.Method2(data,center,'mahalanobis',3,2,10);
       
B2=uint8(zeros(m,n,3));
B2(:,:,1) =uint8(abs(reshape(t2t(:,1),m,n)));




% for i=1:428
%      for j=1:696      
%           if B2(i,j,1)==5          
%              B2(i,j,1)=255;        
%              B2(i,j,2)=0;          
%              B2(i,j,3)=0;    
%           end 
%           if B2(i,j,1)==1  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B2(i,j,1)==3   
%             B2(i,j,1)=56;   
%             B2(i,j,2)=94;
%             B2(i,j,3)=15;  
%          end
%        if B2(i,j,1)==2       
%           B2(i,j,1)=139;  
%           B2(i,j,2)=0;
%           B2(i,j,3)=0;
%        end
%        if B2(i,j,1)==4     
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=0;
%        end
%      end
% end
 for i=1:p 
     for j=1:q      
%           if data(i,j)==4          
%              B(i,j,1)=0;        
%              B(i,j,2)=205;          
%              B(i,j,3)=0;
%           end 
          if B2(i,j)==2  
             B2(i,j,1)=0;
             B2(i,j,2)=0;
             B2(i,j,3)=255;
         end
         if B2(i,j)==4  
            B2(i,j,1)=0;   
            B2(i,j,2)=255;
            B2(i,j,3)=255;  
         end
       if B2(i,j)==1       
          B2(i,j,1)=255;  
          B2(i,j,2)=0;
          B2(i,j,3)=0;
       end
       if data(i,j)==5    
          B2(i,j,1)=0;  
          B2(i,j,2)=255;
          B2(i,j,3)=0;
       end
       if B2(i,j)==3     
          B2(i,j,1)=105;  
          B2(i,j,2)=139;
          B2(i,j,3)=34;
       end
     end
end
figure,imshow(B2);
% clims = [ 1 cluster_num ];
% figure,imagesc(B2,clims);
% colormap(jet)
% figure,imshow(B2,[1 cluster_num]);
% conNUM=3;
% 
% map2=zeros(cluster_num,conNUM);
% for i=1:cluster_num
%     for j=1:conNUM
%     map2(i,j)=i/(1.0*cluster_num);
%     end
% end
% colormap(map2);
% imwrite(B2,map2,'E:\E\SkyDrive\重要备份\区间\毕业设计贺辉\fcm\0911\resultsComparison\2013\2tfs\t2yushucosdc6.bmp');