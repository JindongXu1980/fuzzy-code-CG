 data = rand(100,2);
      [center,U,obj_fcn] = FCMClust(data,2);
      plot(data(:,1), data(:,2),'o');
      hold on;
      maxU = max(U);
      index1 = find(U(1,:) == maxU);
      index2 = find(U(2,:) == maxU);
      line(data(index1,1),data(index1,2),'marker','*','color','g');
      line(data(index2,1),data(index2,2),'marker','*','color','r');
      plot([center([1 2],1)],[center([1 2],2)],'*','color','k')
      hold off;