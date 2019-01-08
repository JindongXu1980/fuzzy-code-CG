%主函数
clear;
 [I,data1] =data_Mread();
 data1=data1(:,1:3);

%  [new_vectors,ddown, dup,dmean]=make_oointerval(I,data); 
 clum_num=6;
 t0=cputime;
[center, U, obj_fcn,BB] = FCMClust(data1,clum_num);
t2=cputime-t0;
% [center, U_u,U_l, obj_fcn] = FCMClust(data1,ldata,label,clum_num);
% U_u=[U_u',unlabel_index];
% U_l=[U_l',label_index];
% U=[U_u',U_l']';
% [~,mark]=sort(U(:,6));
% U=U(mark,:);
% U=(U(:,1:5))';
 maxU =max(U);
      index1 = find(U(1,:) == maxU);
      index2 = find(U(2,:) == maxU);
      index3 = find(U(3,:) == maxU);
      index4 = find(U(4,:) == maxU);
      index5 = find(U(5,:) == maxU);
      index6 = find(U(6,:) == maxU);
      index7 = find(U(7,:) == maxU);
      index8 = find(U(8,:) == maxU);
       index9 = find(U(9,:) == maxU);
      index10 = find(U(10,:) == maxU);
      index11 = find(U(11,:) == maxU);
      index12 = find(U(12,:) == maxU);
%       index13 = find(U(13,:) == maxU);
%       index14 = find(U(14,:) == maxU);
%       index15 = find(U(15,:) == maxU);
%      index16 = find(U(16,:) == maxU);
     
     
      data(index1,1)=1;
      data(index2,1)=2;
      data(index3,1)=3;
      data(index4,1)=4; 
      data(index5,1)=5;
      data(index6,1)=6;
       data(index7,1)=7;
      data(index8,1)=8;
       data(index9,1)=9;
      data(index10,1)=10;
      data(index11,1)=11;
      data(index12,1)=12;
%       data(index13,1)=13;
%       data(index14,1)=14;
%       data(index15,1)=15;
%       data(index16,1)=16;
      [m,n] = size(I(:,:,1));
%       data=reshape(data,591,736);
      data=reshape(data,m,n);
      B=uint8(zeros(m,n,3));
%       颐和园  
%       for i=1:m
%      for j=1:n      
%           if data(i,j)==12       
%              B(i,j,1)=255;        
%              B(i,j,2)=255;          
%              B(i,j,3)=255;
%           end 
%           if data(i,j)==4  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==1 
%             B(i,j,1)=0;   
%             B(i,j,2)=255;
%             B(i,j,3)=255;  
%          end
%        if data(i,j)==2      
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==3  
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==5   
%           B(i,j,1)=105;  
%           B(i,j,2)=139;
%           B(i,j,3)=34;
%        end
%      end
%       end

B=uint8(zeros(m,n,3));
for i=1:m
    for j=1:n
        if data(i,j)==12
            B(i,j,1)=255;        
             B(i,j,2)=255;          
             B(i,j,3)=255;   
        end
    end
end
     figure,imshow(B,'border','tight','initialmagnification','fit');
      set(gcf,'Position',[0 0 n m]);
axis normal;
    
    for i=1:m
     for j=1:n      
%           if data(i,j)==6||data(i,j)==8||data(i,j)==10||data(i,j)==12
%              B(i,j,1)=255;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;
% 
%           end
          if data(i,j)==5||data(i,j)==9||data(i,j)==7
             B(i,j,1)=0;
             B(i,j,2)=255;
             B(i,j,3)=0;

         end
         if data(i,j)==1||data(i,j)==7
            B(i,j,1)=0;   
            B(i,j,2)=0;
            B(i,j,3)=255;  

         end
       if data(i,j)==2
          B(i,j,1)=255;  
          B(i,j,2)=255;
          B(i,j,3)=0;
 
       end
       if data(i,j)==3
          B(i,j,1)=0;  
          B(i,j,2)=255;
          B(i,j,3)=255;

       end
       if data(i,j)==4
           B(i,j,1)=255;  
          B(i,j,2)=0;
          B(i,j,3)=255;

       end
     end
      end
     figure,imshow(B,'border','tight','initialmagnification','fit');
      set(gcf,'Position',[0 0 n m]);
axis normal;   
    
    
%       for i=1:m 
%      for j=1:n      
%           if data(i,j)==12         
%              B(i,j,1)=255;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;    
%           end
%           if data(i,j)==2||data(i,j)==9
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%           if data(i,j)==6||data(i,j)==7||data(i,j)==11  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==3||data(i,j)==5||data(i,j)==8||data(i,j)==1 
%             B(i,j,1)=139;   
%             B(i,j,2)=0;
%             B(i,j,3)=0;  
%          end
%        if data(i,j)==10||data(i,j)==4       
%           B(i,j,1)=107;  
%           B(i,j,2)=142;
%           B(i,j,3)=35;
%        end
%     
%      end
%       end
%      figure,imshow(B,'border','tight','initialmagnification','fit');
%       set(gcf,'Position',[0 0 n m]);
% axis normal;

     


     
%  for i=1:m
%      for j=1:n
%          B(i,j,1)=data(i,j)*16;
%          B(i,j,2)=data(i,j)*16;
%          B(i,j,3)=data(i,j)*16;
%      end
%  end
  % 横琴     
%       for i=1:m 
%      for j=1:n      
%           if data(i,j)==1         
%              B(i,j,1)=255;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;    
%           end
%           if data(i,j)==2
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%           if data(i,j)==3  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==4   
%             B(i,j,1)=139;   
%             B(i,j,2)=0;
%             B(i,j,3)=0;  
%          end
%        if data(i,j)==5       
%           B(i,j,1)=56;  
%           B(i,j,2)=94;
%           B(i,j,3)=15;
%        end
%     
%  end
% 
% end
%      figure,imshow(B,'border','tight','initialmagnification','fit'); 
% %     %颐和园  
%       for i=1:m
%      for j=1:n      
% %           if data(i,j)==4          
% %              B(i,j,1)=0;        
% %              B(i,j,2)=205;          
% %              B(i,j,3)=0;
% %           end 
%           if data(i,j)==5  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==3  
%             B(i,j,1)=0;   
%             B(i,j,2)=255;
%             B(i,j,3)=255;  
%          end
%        if data(i,j)==2       
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==4  
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==1   
%           B(i,j,1)=105;  
%           B(i,j,2)=139;
%           B(i,j,3)=34;
%        end
%      end
%       end
% figure,imshow(B,'border','tight','initialmagnification','fit');
% figure,imshow(B);





      %大横琴
%      for i=1:428 
%      for j=1:696      
%           if data(i,j)==4          
%              B(i,j,1)=139;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;
%           end 
%           if data(i,j)==5 
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
% %          if data(i,j)==4   
% %             B(i,j,1)=0;   
% %             B(i,j,2)=255;
% %             B(i,j,3)=255;  
% %          end
%        if data(i,j)==1      
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==2    
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==3     
%           B(i,j,1)=105;  
%           B(i,j,2)=139;
%           B(i,j,3)=34;
%        end
%      end
% end
% figure,imshow(B);


%珠海
% for i=1:428 
%      for j=1:696      
%           if data(i,j)==4          
%              B(i,j,1)=0;        
%              B(i,j,2)=205;          
%              B(i,j,3)=0;
%           end 
%           if data(i,j)==6  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==3   
%             B(i,j,1)=56;   
%             B(i,j,2)=94;
%             B(i,j,3)=15;  
%          end
%        if data(i,j)==2       
%           B(i,j,1)=139;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==5     
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==1     
%           B(i,j,1)=141;  
%           B(i,j,2)=238;
%           B(i,j,3)=238;
%        end
%      end
% end
% figure,imshow(B);










% for i=1:400 
%      for j=1:400      
%           if data(i,j)==4          
%              B(i,j,1)=255;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;    
%           end 
%           if data(i,j)==1  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==3   
%             B(i,j,1)=139;   
%             B(i,j,2)=0;
%             B(i,j,3)=0;  
%          end
%        if data(i,j)==2       
%           B(i,j,1)=56;  
%           B(i,j,2)=94;
%           B(i,j,3)=15;
%        end
%        if data(i,j)==5      
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==6      
%           B(i,j,1)=97;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%  end
% 
% end
% figure,imshow(B);
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