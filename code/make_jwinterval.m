function [ddown,dup]=make_jwinterval(data)  
      dup=max(data,[],2);
      ddown=min(data,[],2);