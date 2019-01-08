%x是需要输入图像，y是分割结果
function [new_vectors,ddown,dup,dmean]=make_oointerval(x,data)   
% y = load('D:\WatershedResult\hq2008sub07112_flag.txt');
% y = load('D:\WatershedResult\spotsub5_flag200.txt');
y = load('D:\WatershedResult\TIF09100gdsub0813123.txt');
figure,imagesc(y);
%  [x,data] = Mread();
[height,width,sam]=size(x);   %输入图像是hightxwidth的
 ddown = zeros(height*width,sam);
 dup = zeros(height*width,sam);
 dmean = zeros(height*width,sam);
%  D(:,1) = reshape(y,height*width,1);
 num = height*width;
xdown = zeros(height, width,sam);
xup = zeros(height,width,sam);
seg=unique(y);
[n cz]=size(seg);
row_num = zeros(n,1000);
col_num = zeros(n,1000);
vec_mean = zeros(n,sam);
vec_min  = zeros(n,sam);
vec_max = zeros(n,sam);
vec_std = zeros(n,sam);

for i=1:n
    [r,c,w] = find(y==seg(i,1));
    [ro co] = size(r);
    row_num(i,1:ro)=r';
    col_num(i,1:ro)=c';
end

for j=1:n
  mask_len(j)=length(find(row_num(j,:)));
  z=mask_len(j);
 for q=1:z
   for v=1:height
       %for p=1:width
      if(v==row_num(j,q))
            new_vectors(j,q,:)=x(v,col_num(j,q),:);
      end
     %  end
   end
           
   end
for s=1:sam
 vec_mean(j,s) = mean(new_vectors(j,:,s));
 vec_min(j,s) = min(new_vectors(j,:,s));
 vec_max(j,s) = max(new_vectors(j,:,s));
 vec_std(j,s) = std2(new_vectors(j,:,s));
end
end

for i=1:n
    mask_len(i)=length(find(row_num(i,:)));
    z=mask_len(i);
 for q=1:z
      for s=1:sam
%           %=======均值方差
%      xdown(row_num(i,q),col_num(i,q),s)=  vec_mean(i,s)-3*vec_std(i,s);
%      xup(row_num(i,q),col_num(i,q),s)=  vec_mean(i,s)+3*vec_std(i,s);
%       xmean(row_num(i,q),col_num(i,q),s)=  vec_mean(i,s);
%          %=====END均值方差
                %=======原值 均值方差
     xdown(row_num(i,q),col_num(i,q),s) = x(row_num(i,q),col_num(i,q),s)-1.5*vec_std(i,s);
%      if( xdown(row_num(i,q),col_num(i,q),s)<0) 
%           xdown(row_num(i,q),col_num(i,q),s)=0;
%      end
     xup(row_num(i,q),col_num(i,q),s) = x(row_num(i,q),col_num(i,q),s)+1.5*vec_std(i,s);
%       xmean(row_num(i,q),col_num(i,q),s)=  vec_mean(i,s);
         %=====END原值 均值方差
%          %=======极大极小值
%         xdown(row_num(i,q),col_num(i,q),s)=  vec_min(i,s);
%         xup(row_num(i,q),col_num(i,q),s)=  vec_max(i,s); 
% %         %========END极大极小值
      end
 end
end
% figure,imshow(xdown),title('xdown');
% figure,imshow(x),title('x');
% figure,imshow(xup),title('xup');
for m=1:sam
  ddown(:,m) = reshape(xdown (:,:,m),num,1);
  dup(:,m) = reshape(xup (:,:,m),num,1);
%   dmean(:,m) = reshape(xmean (:,:,m),num,1);
end
 [k,p]=size(data);

for i=1:k
    for j=1:p
     % data1(i,j)=data(i,j)-stda(i,j)
      if(ddown(i,j)<0)
          ddown(i,j)=0;       
      end
    end
end   
