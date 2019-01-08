% Example to demonstrate how to use IT2FLS.m and EIASC.m
% Dongrui Wu, GE Research, drwu09@gmail.com, April 7, 2011
%
clc; clear all; close all;

%% Example 1:
X=[-1.5 -1.5 -.5 1.5 -1.5 -1.5 -1.5 .5 1  -1.5 -1.5 -.5 1.5 -1.5 -1.5 -1.5 .5  1
   -1.5 -1.5 -.5 1.5 -1.5 -1.5 -1.5 .5 1  -1.5   .5 1.5 1.5  -.5  1.5  1.5 1.5 1
   -1.5   .5 1.5 1.5  -.5  1.5  1.5 1.5 1  -1.5 -1.5 -.5 1.5 -1.5 -1.5 -1.5 .5  1
   -1.5   .5 1.5 1.5  -.5  1.5  1.5 1.5 1  -1.5   .5 1.5 1.5  -.5  1.5  1.5 1.5 1];
Y=[-1 -.9; -.6 -.4; .4 .6; .9 1];
x=[-.3 .6];
[y, yl, yr]=IT2FLS(x,X,Y)

%% Example 2:
% The three IT2 FSs in the x1 domain: each IT2 FS is represented by 9 points shown in the attached Word file.
FS1=[-1.6 -1.6 -1 -.1 -1.6 -1.6 -1 -.4 1;
    -1 0 0 1 -.7 0 0 .7 1;
    0.1 1 1.6 1.6 .4 1 1.6 1.6 1];
% The three IT2 FSs in the x2 domain: each IT2 FS is represented by 9 points shown in the attached Word file.
FS2=[-1.6 -1.6 -1 -.1 -1.6 -1.6 -1 -.7 1;
    -1 0 0 1 -.4 0 0 .4 1;
    .1 1 1.6 1.6 .7 1 1.6 1.6 1];

fl1=zeros(1,3); % lower firing levels of the three IT2 FSs in x1 domain: initialization
fu1=zeros(1,3); % upper firing levels of the three IT2 FSs in x1 domain: initialization
fl2=zeros(1,3); % lower firing levels of the three IT2 FSs in x2 domain: initialization
fu2=zeros(1,3); % upper firing levels of the three IT2 FSs in x2 domain: initialization
fl=zeros(1,9); % lower firing levels of the 9 rules
fu=zeros(1,9); % upper firing levels of the 9 rules
Ys=(1:9)'; % consequents of the 9 rules

N=80; % number of discretizations in x1 and x2 domain
X1=linspace(-1,1,N); X2=linspace(-1,1,N);
Y1=zeros(N,N); % the output using IT2FLS.m
Y2=zeros(N,N); % the output using EKM.m

%% Method 1: Use IT2FLS.m
for n1=1:N
    for n2=1:N
        Y1(n1,n2)=IT2FLS([X1(n1) X2(n2)],[FS1([1 1 1 2 2 2 3 3 3],:) FS2([1 2 3 1 2 3 1 2 3],:)],[Ys Ys]); % output of the IT2 FLS
    end
end

%% Method 2: Use EIASC.m
for n1=1:N
    for k=1:3 % firing intervals in x1 domain
        fu1(k)=mg(X1(n1),FS1(k,1:4));
        fl1(k)=FS1(k,9)*mg(X1(n1),FS1(k,5:8));
    end
    for n2=1:N
        for k=1:3
            fu2(k)=mg(X2(n2),FS2(k,1:4)); % firing intervals in x2 domain
            fl2(k)=FS2(k,9)*mg(X2(n2),FS2(k,5:8));
            % compute the firing intervals of the rules
            fl(k)=fl1(1)*fl2(k);  fu(k)=fu1(1)*fu2(k);
            fl(3+k)=fl1(2)*fl2(k); fu(3+k)=fu1(2)*fu2(k);
            fl(6+k)=fl1(3)*fl2(k); fu(6+k)=fu1(3)*fu2(k);
        end
        Y2(n1,n2)=EIASC(Ys',Ys',fl,fu); % output of the IT2 FLS
    end
end

%%
figure;
set(gcf,'DefaulttextFontName','times new roman','DefaultaxesFontName','times new roman');
set(gcf,'DefaulttextFontAngle','italic','DefaultaxesFontSize',8,'DefaulttextFontSize',12);

subplot(221);
for k=1:3
    fill(FS1(k,[1:4 8:-1:5]),[0 1 1 0 0 FS1(k,[9 9]) 0],[.9 .9 .9]);
    hold on
end
for k=1:3
    plot(FS1(k,[1:4 8:-1:5]),[0 1 1 0 0 FS1(k,[9 9]) 0],'linewidth',2);
end
axis([min(FS1(:)) max(FS1(:)) 0 1.2]);
xlabel('x_1','fontsize',13);   ylabel('u','fontsize',13);
set(gca,'xtick',sort(unique([-1 1 -.1 .1 -.7 .7 -.4 .4])));
title('IT2 FSs in x_1 domain','fontsize',13);

subplot(222);
for k=1:3
    fill(FS2(k,[1:4 8:-1:5]),[0 1 1 0 0 FS2(k,[9 9]) 0],[.9 .9 .9]);
    hold on
end
for k=1:3
    plot(FS2(k,[1:4 8:-1:5]),[0 1 1 0 0 FS2(k,[9 9]) 0],'linewidth',2);
end
axis([min(FS2(:)) max(FS2(:)) 0 1.2]);
xlabel('x_2','fontsize',13);   ylabel('u','fontsize',13);
set(gca,'xtick',sort(unique([-1 1 -.1 .1 -.7 .7 -.4 .4])));
title('IT2 FSs in x_2 domain','fontsize',13);

subplot(223);
surf(X2,X1,Y1); hold on; surf([-1 -1],[-.1 -.1],[0 4; 0 4]); surf([-1 -1],[.1 .1],[0 4; 0 4]);
surf([-.7 -.7],[-1 -1],[0 1.5; 0 1.5]); surf([-.4 -.4],[-1 -1],[0 1.5; 0 1.5]);
surf([.7 .7],[-1 -1],[0 2.6; 0 2.6]); surf([.4 .4],[-1 -1],[0 2.6; 0 2.6]);
xlabel('x_2','fontsize',14); ylabel('x_1','fontsize',14); zlabel('y','fontsize',14);
set(gca,'xtick',sort(unique([-1 1 FS2([5:8 9:16 21:24])])));
set(gca,'ytick',sort(unique([-1 1 -.1 .1])));
title('Control surface computed by IT2FLS.m','fontsize',13);

subplot(224);
surf(X2,X1,Y2); hold on; surf([-1 -1],[-.1 -.1],[0 4; 0 4]); surf([-1 -1],[.1 .1],[0 4; 0 4]);
surf([-.7 -.7],[-1 -1],[0 1.5; 0 1.5]); surf([-.4 -.4],[-1 -1],[0 1.5; 0 1.5]);
surf([.7 .7],[-1 -1],[0 2.6; 0 2.6]); surf([.4 .4],[-1 -1],[0 2.6; 0 2.6]);
xlabel('x_2','fontsize',14); ylabel('x_1','fontsize',14); zlabel('y','fontsize',14);
set(gca,'xtick',sort(unique([-1 1 FS2([5:8 9:16 21:24])])));
set(gca,'ytick',sort(unique([-1 1 -.1 .1])));
title('Control surface computed by EIASC.m','fontsize',13);
