%主函数
clear;
 [I,data1] =data_Mread();
 data1=data1(:,1:3);
%  load('label.mat');
load('label.mat');
b=data;
clear data;
 [p,q]=size(b);
%  [~,data2]=label_Mread();
B=reshape(b,p*q,1);
 for i=1:size(data1,1)
 data1(i,4)=i;
%  data2(i,4)=i;
B(i,2)=i;
 end
ran=randperm(p*q);
bit=abs(0.05*p*q);
label_index=sortrows((ran(1:bit))');        %随机标记样本
% label_index=[];
% % for i=325:573
% %     label_index=[label_index 262+(i-1)*452:284+(i-1)*452];
% % end
% for i=157:187
%     label_index=[label_index 147+(i-1)*452:185+(i-1)*452];
% end
% for i=9:80
%     label_index=[label_index 50+(i-1)*428:89+(i-1)*428];
% end


%特定选取区域标记
% label_index=[80000:96000]';
% label_index=[1:43497]';
% label_index=[];
% label_index=[];
% for i=1:100
%     label_index=[label_index 129+(i-1)*428:228+(i-1)*428];
% end
% for i=600:696
%     label_index=[label_index 1+(i-1)*428:100+(i-1)*428];
% end
% for i=200:299
%     label_index=[label_index 308+(i-1)*428:407+(i-1)*428];
% end
%  label_index=[label_index 308+240*428:338+240*428];
 
% label_index=[];
% for i=24:123
%     label_index=[label_index 28+(i-1)*591:127+(i-1)*591];
% end
% for i=395:494
%     label_index=[label_index 5+(i-1)*591:104+(i-1)*591];
% end
% for i=624:723
%     label_index=[label_index 398+(i-1)*591:497+(i-1)*591];
% end 
% for i=250:349
%     label_index=[label_index 490+(i-1)*591:589+(i-1)*591];
% end 
% for i=210:260
%     label_index=[label_index 210+(i-1)*591:309+(i-1)*591];
% end 

% label_index=label_index;

ldata=data1(label_index,:);
unlabel_index=setdiff(data1(:,4),label_index);
udata=data1(unlabel_index,:);
label=B(label_index,:);
%  [new_vectors,ddown, dup,dmean]=make_oointerval(I,data); 
 clum_num=12;
% [center, U_u,U_l, obj_fcn] = FCMClust(udata,ldata,label,clum_num);
t0=cputime;
[center, U_u,U_l, obj_fcn] = FCMClust(data1,ldata,label,clum_num,t0);
% t1
t2=cputime-t0;
% U_u=[U_u',unlabel_index];
% U_l=[U_l',label_index'];
% U=[U_u',U_l']';
% [~,mark]=sort(U(:,clum_num+1));
% U=U(mark,:);
% U=(U(:,1:clum_num))';
 U=U_u;
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
%       index7 = find(U(7,:) == maxU);
%       index8 = find(U(8,:) == maxU);
%        index9 = find(U(9,:) == maxU);
%       index10 = find(U(10,:) == maxU);
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
%        data(index7,1)=7;
%       data(index8,1)=8;
%        data(index9,1)=9;
%       data(index10,1)=10;
      [m,n] = size(I(:,:,1));
      data=reshape(data,p,q);
      
      B=uint8(zeros(m,n,3));
       for i=1:m 
     for j=1:n 
    if data(i,j)==11
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
          if data(i,j)==6||data(i,j)==7||data(i,j)==12||data(i,j)==11  
             B(i,j,1)=255;        
             B(i,j,2)=0;          
             B(i,j,3)=0;
          end 
          if data(i,j)==5
             B(i,j,1)=0;
             B(i,j,2)=255;
             B(i,j,3)=0;
         end
         if data(i,j)==10||data(i,j)==4
            B(i,j,1)=0;   
            B(i,j,2)=0;
            B(i,j,3)=255;  
         end
       if data(i,j)==3||data(i,j)==2   
          B(i,j,1)=255;  
          B(i,j,2)=255;
          B(i,j,3)=0;
       end
       if data(i,j)==9||data(i,j)==1
          B(i,j,1)=0;  
          B(i,j,2)=255;
          B(i,j,3)=255;
       end
       if data(i,j)==8
          B(i,j,1)=255;  
          B(i,j,2)=0;
          B(i,j,3)=255;
       end
     end
     end
 figure,imshow(B,'border','tight','initialmagnification','fit');
      set(gcf,'Position',[0 0 n m]);
axis normal;
            
            % 横琴     
%       for i=1:m 
%      for j=1:n      
%           if data(i,j)==1         
%              B(i,j,1)=255;        
%              B(i,j,2)=0;          
%              B(i,j,3)=0;    
%           end
%           if data(i,j)==4
%           B(i,j,1)=0;  
%           B(i,j,2)=255;
%           B(i,j,3)=0;
%        end
%           if data(i,j)==5  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==2   
%             B(i,j,1)=139;   
%             B(i,j,2)=0;
%             B(i,j,3)=0;  
%          end
%        if data(i,j)==3       
%           B(i,j,1)=56;  
%           B(i,j,2)=94;
%           B(i,j,3)=15;
%        end
%        if data(i,j)==6      
%           B(i,j,1)=0;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%  end
% 
% end
%      figure,imshow(B,'border','tight','initialmagnification','fit');
%       set(gcf,'Position',[0 0 281 288]);
% axis normal;
      
      
%       for i=1:p 
%      for j=1:q      
% %           if data(i,j)==4          
% %              B(i,j,1)=0;        
% %              B(i,j,2)=205;          
% %              B(i,j,3)=0;
% %           end 
%           if data(i,j)==2  
%              B(i,j,1)=0;
%              B(i,j,2)=0;
%              B(i,j,3)=255;
%          end
%          if data(i,j)==4  
%             B(i,j,1)=0;   
%             B(i,j,2)=255;
%             B(i,j,3)=255;  
%          end
%        if data(i,j)==1       
%           B(i,j,1)=255;  
%           B(i,j,2)=0;
%           B(i,j,3)=0;
%        end
%        if data(i,j)==5   
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



      %大横琴
%      for i=1:428 
%      for j=1:696      
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
%        if data(i,j)==4     
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