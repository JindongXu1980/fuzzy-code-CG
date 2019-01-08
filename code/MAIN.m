%主函数
clear;
 [I,data] =Mread();
%  [new_vectors,ddown, dup,dmean]=make_oointerval(I,data); 
 clum_num=5;
 t0=cputime;
 [center,U,obj_fcn] =FCMClust(data,clum_num);
t2=cputime-t0;
 
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
%       index11 = find(U(11,:) == maxU);
%       index12 = find(U(12,:) == maxU);
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
%       data(index11,1)=11;
%       data(index12,1)=12;
      [m,n] = size(I(:,:,1));
      dd=data(:,1);
      B2=uint8(zeros(m,n,3));
      B1=zeros(m,n);
B1(:,:) =uint8(abs(reshape(dd,m,n)));
   % 横琴     
   B2=uint8(zeros(m,n,3));
for i=1:m 
     for j=1:n    
         if B1(i,j)==12
              B2(i,j,1)=255;        
             B2(i,j,2)=255;          
             B2(i,j,3)=255; 
         end
     end
end
  figure,imshow(B2,'border','tight','initialmagnification','fit');
set(gcf,'Position',[0 0 n m]);
axis normal;

      for i=1:m 
     for j=1:n      
          if B1(i,j)==3||B1(i,j)==8||B1(i,j)==11        
             B2(i,j,1)=255;        
             B2(i,j,2)=0;          
             B2(i,j,3)=0;    
          end
          if B1(i,j)==4||B1(i,j)==12
          B2(i,j,1)=0;  
          B2(i,j,2)=255;
          B2(i,j,3)=0;
       end
          if B1(i,j)==2||B1(i,j)==7   
             B2(i,j,1)=0;
             B2(i,j,2)=0;
             B2(i,j,3)=255;
         end
         if B1(i,j)==1||B1(i,j)==9 
            B2(i,j,1)=255;   
            B2(i,j,2)=255;
            B2(i,j,3)=0;  
         end
       if B1(i,j)==10      
          B2(i,j,1)=0;  
          B2(i,j,2)=255;
          B2(i,j,3)=255;
       end
        if B1(i,j)==5||B1(i,j)==6       
          B2(i,j,1)=255;  
          B2(i,j,2)=0;
          B2(i,j,3)=255;
        end
 end

end
     figure,imshow(B2,'border','tight','initialmagnification','fit');
set(gcf,'Position',[0 0 n m]);
axis normal;
 %大横琴
%  for i=1:m
%      for j=1:n      
% %           if data(i,j)==4          
% %              B(i,j,1)=0;        
% %              B(i,j,2)=205;          
% %              B(i,j,3)=0;
% %           end 
%           if B1(i,j)==2  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B1(i,j)==3 
%             B2(i,j,1)=0;   
%             B2(i,j,2)=255;
%             B2(i,j,3)=255;  
%          end
%        if B1(i,j)==5      
%           B2(i,j,1)=255;  
%           B2(i,j,2)=0;
%           B2(i,j,3)=0;
%        end
%        if B1(i,j)==4   
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=0;
%        end
%        if B1(i,j)==1  
%           B2(i,j,1)=105;  
%           B2(i,j,2)=139;
%           B2(i,j,3)=34;
%        end
%      end
% end
% figure,imshow(B2,'border','tight','initialmagnification','fit');
% for i=1:591 
%      for j=1:736      
% %           if B1(i,j,1)==6          
% %              B2(i,j,1)=0;        
% %              B2(i,j,2)=255;          
% %              B2(i,j,3)=0;    
% %           end 
%           if B1(i,j,1)==5  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B1(i,j,1)==4   
%             B2(i,j,1)=0;   
%             B2(i,j,2)=255;
%             B2(i,j,3)=0;  
%          end
%        if B1(i,j,1)==2       
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=255;
%        end
%        if B1(i,j,1)==1     
%           B2(i,j,1)=255;  
%           B2(i,j,2)=0;
%           B2(i,j,3)=0;
%        end
%        if B1(i,j,1)==3   
%           B2(i,j,1)=105;  
%           B2(i,j,2)=139;
%           B2(i,j,3)=34;
%        end
%      end
% end


% for i=1:400 
%      for j=1:400      
%           if B1(i,j,1)==1         
%              B2(i,j,1)=255;        
%              B2(i,j,2)=0;          
%              B2(i,j,3)=0;    
%           end 
%           if B1(i,j,1)==4  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B1(i,j,1)==2   
%             B2(i,j,1)=56;   
%             B2(i,j,2)=94;
%             B2(i,j,3)=15;  
%          end
%        if B1(i,j,1)==6       
%           B2(i,j,1)=139;  
%           B2(i,j,2)=0;
%           B2(i,j,3)=0;
%        end
%        if B1(i,j,1)==5     
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=0;
%        end
%        if B1(i,j,1)==3     
%           B2(i,j,1)=118;  
%           B2(i,j,2)=238;
%           B2(i,j,3)=198;
%        end
%      end
% end











% for i=1:400 
%      for j=1:400      
%           if B1(i,j)==4          
%              B2(i,j,1)=255;        
%              B2(i,j,2)=0;          
%              B2(i,j,3)=0;    
%           end 
%           if B1(i,j)==1  
%              B2(i,j,1)=0;
%              B2(i,j,2)=0;
%              B2(i,j,3)=255;
%          end
%          if B1(i,j)==3   
%             B2(i,j,1)=139;   
%             B2(i,j,2)=0;
%             B2(i,j,3)=0;  
%          end
%        if B1(i,j)==2       
%           B2(i,j,1)=56;  
%           B2(i,j,2)=94;
%           B2(i,j,3)=15;
%        end
%        if B1(i,j)==5      
%           B2(i,j,1)=0;  
%           B2(i,j,2)=255;
%           B2(i,j,3)=0;
%        end
%  end
% 
% end
% figure,imshow(B2,'border','tight','initialmagnification','fit');
% clims = [ 1 clum_num ];
% figure,imagesc(B1,clims);
% colormap(jet)
% figure,imshow(B1,[1 clum_num]);
% conNUM=3;
% 
% map1=zeros(clum_num,conNUM);
% for i=1:clum_num
%     for j=1:conNUM
%     map1(i,j)=i/(1.0*clum_num);
%     end
% end
% colormap(map1);
% imwrite(B1,map1,'E:\E\重要备份\区间\毕业设计贺辉\fcm\0911\resultsComparison\fcm\fcmhqsub0701220314c6(Udist 200 2.5 ).bmp');