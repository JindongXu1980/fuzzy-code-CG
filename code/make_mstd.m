%x是需要输入图像，y是分割结果
function [mymean,mystd]=make_mstd(x,data)   
y = load('D:\WatershedResult\hq2008sub07112_flag.txt');
%y = load('D:\WatershedResult\spotsub5_flag200.txt');
figure,imagesc(y);
%  [x,data] = Mread();
[height,width,sam]=size(x);   %输入图像是hightxwidth的
x=double(x);
 ddown = zeros(height*width,sam);
 dup = zeros(height*width,sam);
 dcom = zeros(height*width,sam,2);
%  D(:,1) = reshape(y,height*width,1);
 num = height*width;
xdown = zeros(height, width,sam);
xup = zeros(height,width,sam);
pi=3.1415926;
ta=1/(sqrt(2*pi));
t3=ones(size(x,1),1);
seg=unique(y);
n = length(seg);
row_num = zeros(n,1000);
col_num = zeros(n,1000);
vec_mean = zeros(n,sam);
vec_min  = zeros(n,sam);
vec_max = zeros(n,sam);
vec_std = zeros(n,sam);

for i=1:n
    [r,c,w] = find(y==seg(i));
    ro = length(r);
    row_num(i,1:ro)=r;
    col_num(i,1:ro)=c;
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
%           %=======获得均值 方差图
     imean(row_num(i,q),col_num(i,q),s) = vec_mean(i,s)/255;
     istd(row_num(i,q),col_num(i,q),s)  = vec_std(i,s)/255;
      end
 end
end
% figure,imshow(imean,[]),title('均值图');
% figure,imshow(istd,[]),title('方差图');
% figure,imshow(xup),title('xup');
for i=1:sam
  mymean(:,i) = reshape(imean(:,:,i),num,1);
  mystd(:,i) = reshape(istd(:,:,i),num,1);
%   dmean(:,m) = reshape(xmean (:,:,m),num,1);
end
