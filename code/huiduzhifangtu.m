function [center]=huiduzhifangtu(data,seca,secb,I)

% I=imread('ͼ3(a) .tif');   
% subplot(121);  
% imshow(I);  
% title('Original Image');  
% G=rgb2gray(I);   
% subplot(122);   
% imhist(G);   
% title('Histogram'); 
G=data(:,1);
maxG=max(max(G));
minG=min(min(G));

jishu1=zeros(255,1);
A=G(G<=minG+38);
center=zeros(6,size(data,2),2);
for i=1:size(A,1)
    for j=minG:maxG
        if A(i,1)==j
            jishu1(j,1)=jishu1(j,1)+1;
            break;
        end
    end
end
shu1=find(jishu1~=0);
shu1(:,2)=jishu1(shu1);
shu1= sortrows(shu1,2);
data11=seca(find(data(:,1)==shu1(1,1)),:);
data12=secb(find(data(:,1)==shu1(1,1)),:);
center1(1,:)=data11(1,:);
center2(1,:)=data12(1,:);

jishu2=zeros(255,1);
B=G(G>minG+38&G<=minG+76);
for i=1:size(B,1)
    for j=minG:maxG
        if B(i)==j
            jishu2(j)=jishu2(j)+1;
            break;
        end
    end
end
shu2=find(jishu2~=0);
shu2(:,2)=jishu2(shu2);
shu2= sortrows(shu2,2);
data21=seca(find(data(:,1)==shu2(1,1)),:);
data22=secb(find(data(:,1)==shu2(1,1)),:);
center1(2,:)=data21(1,:);
center2(2,:)=data22(1,:);


jishu3=zeros(255,1);
C=G(G<=minG+114&G>minG+76);
for i=1:size(C,1)
    for j=minG:maxG
        if C(i)==j
            jishu3(j)=jishu3(j)+1;
            break;
        end
    end
end
shu3=find(jishu3~=0);
shu3(:,2)=jishu3(shu3);
shu3= sortrows(shu3,2);
data31=seca(find(data(:,1)==shu3(1,1)),:);
data32=secb(find(data(:,1)==shu3(1,1)),:);
center1(3,:)=data31(1,:);
center2(3,:)=data32(1,:);

jishu4=zeros(255,1);
D=G(G<=minG+152&G>minG+114);
for i=1:size(D,1)
    for j=minG:maxG
        if D(i)==j
            jishu4(j)=jishu4(j)+1;
            break;
        end
    end
end
shu4=find(jishu4~=0);
shu4(:,2)=jishu4(shu4);
shu4= sortrows(shu4,2);
data41=seca(find(data(:,1)==shu4(1,1)),:);
data42=secb(find(data(:,1)==shu4(1,1)),:);
center1(4,:)=data41(1,:);
center2(4,:)=data42(1,:);


jishu5=zeros(255,1);
E=G(G<=minG+190&G>minG+152);
for i=1:size(E,1)
    for j=minG:maxG
        if E(i)==j
            jishu5(j)=jishu5(j)+1;
            break;
        end
    end
end
shu5=find(jishu5~=0);
shu5(:,2)=jishu5(shu5);
shu5= sortrows(shu5,2);
data51=seca(find(data(:,1)==shu5(1,1)),:);
data52=secb(find(data(:,1)==shu5(1,1)),:);
center1(5,:)=data51(1,:);
center2(5,:)=data52(1,:);

jishu6=zeros(255,1);
F=G(G>minG+190);
for i=1:size(F,1)
    for j=minG:maxG
        if F(i)==j
            jishu6(j)=jishu6(j)+1;
            break;
        end
    end
end
shu6=find(jishu6~=0);
shu6(:,2)=jishu6(shu6);
shu6= sortrows(shu6,2);
data61=seca(find(data(:,1)==shu6(1,1)),:);
data62=secb(find(data(:,1)==shu6(1,1)),:);
center1(6,:)=data61(1,:);
center2(6,:)=data62(1,:);

center(:,:,1)=center1;
center(:,:,2)=center2;
