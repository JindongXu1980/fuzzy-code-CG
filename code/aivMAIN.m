%主函数
%   [I,data] =Mread();
%    [I,data] =myLread();
clear;
[I,data] = Mread();
data=data(:,1:3);
I=I(:,:,1:3);
[ddown,dup,means] = make_neiinterval(I,data);
% imshow(I);
%  [ddown,dup] = make_neiinterval(I,data);% 区间构造法1
% [new_vectors,ddown,dup] = make_oointerval(I,data);%面向对象区间构造
% [ddown,dup]=make_jwinterval(data);
% [ddown,dup,dinterval]=make_siminterval(data);




% [seca,secb,means]=section2(I);
% [imageWidth,imageHeight,samples]=size(I);
% for m=1:samples
%   ddown(:,m) = reshape(seca (:,:,m),imageWidth*imageHeight,1);
%   dup(:,m) = reshape(secb (:,:,m),imageWidth*imageHeight,1);
% %   D(:,m) = reshape(Z(:,:,m),imageWidth*imageHeight,1);%=======选择波段参与
% end




  cluster_num=5;
%   center=huiduzhifangtu(data,ddown,dup,I);
% [center_new, U, obj_fcn] = aivFCM(data,ddown,dup,center, cluster_num,means);
[center, U, obj_fcn] = ivFCMClust(data,ddown,dup, cluster_num, means);
%   maxU =sort(max(U));
  maxU =max(U);
      index1 = find(U(1,:) == maxU);
      index2 = find(U(2,:) == maxU);
      index3 = find(U(3,:) == maxU);
      index4 = find(U(4,:) == maxU);
      index5 = find(U(5,:) == maxU);
%       index6 = find(U(6,:) == maxU);
%       index7 = find(U(7,:) == maxU);
%       index8 = find(U(8,:) == maxU);
%        index9 = find(U(9,:) == maxU);
%       index10 = find(U(10,:) == maxU);
      data(index1,1)=1;
      data(index2,1)=2;
      data(index3,1)=3;
      data(index4,1)=4;
      data(index5,1)=5;
%       data(index6,1)=6;
%        data(index7,1)=7;
%       data(index8,1)=8;
%        data(index9,1)=9;
%       data(index10,1)=10;
      [m,n] = size(I(:,:,1));
      dd=data(:,1);
      B=uint8(zeros(m,n,3));
% B(:,:,1) =uint8(abs(reshape(dd,m,n)));
B2=uint8(zeros(m,n));
B2(:,:) =uint8(abs(reshape(dd,m,n)));
% B=B2;
      % 横琴     
      for i=1:m 
     for j=1:n      
          if B2(i,j)==5         
             B(i,j,1)=255;        
             B(i,j,2)=0;          
             B(i,j,3)=0;    
          end
          if B2(i,j)==1
          B(i,j,1)=0;  
          B(i,j,2)=255;
          B(i,j,3)=0;
       end
          if B2(i,j)==3  
             B(i,j,1)=0;
             B(i,j,2)=0;
             B(i,j,3)=255;
         end
         if B2(i,j)==4   
            B(i,j,1)=139;   
            B(i,j,2)=0;
            B(i,j,3)=0;  
         end
       if B2(i,j)==2       
          B(i,j,1)=56;  
          B(i,j,2)=94;
          B(i,j,3)=15;
       end
    
 end

end
     figure,imshow(B,'border','tight','initialmagnification','fit');
     set(gcf,'Position',[0 0 400 400]);
axis normal;
% for i=1:591 
%      for j=1:736     
% %           if data(i,j)==4          
% %              B(i,j,1)=0;        
% %              B(i,j,2)=205;          
% %              B(i,j,3)=0;
% %           end 
%           if B(i,j)==2  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if B(i,j)==4  
%             B(i,j,1)=0;   
%             B(i,j,2)=255;
%             B(i,j,3)=255;  
%          end
%        if B(i,j)==1       
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if B(i,j)==5    
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if B(i,j)==3     
%           B(i,j,1)=105;  
%           B(i,j,2)=139;
%           B(i,j,3)=34;
%        end
%      end
% end
% figure,imshow(B);


%横琴
% for i=1:400 
%      for j=1:400      
%           if B2(i,j,1)==2          
%              B2(i,j,1)=0;        
%              B2(i,j,2)=205;          
%              B2(i,j,3)=0;    
%           end 
%           if B2(i,j,1)==3  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B2(i,j,1)==1   
%             B2(i,j,1)=56;   
%             B2(i,j,2)=94;
%             B2(i,j,3)=15;  
%          end
%        if B2(i,j,1)==4       
%           B2(i,j,1)=139;  
%           B2(i,j,2)=0;
%           B2(i,j,3)=0;
%        end
%        if B2(i,j,1)==5     
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=0;
%        end
%        if B2(i,j,1)==6     
%           B2(i,j,1)=141;  
%           B2(i,j,2)=238;
%           B2(i,j,3)=238;
%        end
%      end
% end
% figure,imshow(B2,'border','tight','initialmagnification','fit');



% clims = [ 1 cluster_num ];
% figure,imagesc(B,clims);
% colormap(jet)
% figure,imshow(B,[1 cluster_num]);
% conNUM=3;
% 
% map=zeros(cluster_num,conNUM);
% for i=1:cluster_num
%     for j=1:conNUM
%     map(i,j)=i/(1.0*cluster_num);
%     end
% end
% colormap(map);
% imwrite(B,map,'E:\E\重要备份\区间\毕业设计贺辉\fcm\0911\resultsComparison\ivjwg\ivspot5subc6( m=2.5 500 maxmind ).bmp');