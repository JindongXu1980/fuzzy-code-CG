%Ö÷º¯Êý
  [I,data] =Mreadiv();
 [center,U,obj_fcn] =ivFCMClust(data,6);
 data1=zeros(size(data,1),size(data,2));
  maxU = max(U);
 
      index1 = find(U(1,:) == maxU);
      index2 = find(U(2,:) == maxU);
      index3 = find(U(3,:) == maxU);
      index4 = find(U(4,:) == maxU);
      index5 = find(U(5,:) == maxU);
      index6 = find(U(6,:) == maxU);
      data1(index1,1)=1;
      data1(index2,1)=2;
      data1(index3,1)=3;
      data1(index4,1)=4;
      data1(index5,1)=5;
      data1(index6,1)=6;
      [m,n] = size(I(:,:,1));
      B=zeros(m,n)
B(:,:) =abs(reshape(data1(:,1),m,n));
clims = [ 1 6 ];
figure,imagesc(B,clims);
figure,imshow(B,[1 6]);