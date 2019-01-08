clear;

clc;

num=1:500;

% optimal=obj_fcn1(1:500,:)';
% plot(num,optimal,'-','color',[1 0 0])
% % plot(num,optimal,'ro-',num,fbr,'b*-',num,VBF,'k>-',num,DFR,'g.-','linewidth',2)
% axis([0,100,3*10^6,0.8*10^7])
% set(gca,'XTick',[0:20:100])
% set(gca,'YTick',[3*10^6:2.5*10^6:0.8*10^7])

% 
% VBF=obj_fcn2(1:500,:)';
% plot(num,VBF,'-','linewidth',2)
% % plot(num,optimal,'ro-',num,fbr,'b*-',num,VBF,'k>-',num,DFR,'g.-','linewidth',2)
% axis([0,300,2.62*10^8,2.7*10^8])
% set(gca,'XTick',[0:20:300])
% set(gca,'YTick',[2.62*10^8:0.5*10^7:2.7*10^8])
num=1:100;
VBF=BB(6,:);
plot(num,VBF,'-','color',[0 1 0])
% plot(num,optimal,'ro-',num,fbr,'b*-',num,VBF,'k>-',num,DFR,'g.-','linewidth',2)
axis([0,100,0,1])
set(gca,'XTick',[0:10:100])
set(gca,'YTick',[0:0.1:1])

xlabel('迭代次数')

ylabel('自适应因子')

% grid on
% 
% legend('自适应因子','FBR','VBF','DFR')