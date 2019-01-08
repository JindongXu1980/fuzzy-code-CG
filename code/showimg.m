
samples = 3;
% fax = factor(samples);  
% plotHt = prod(fax,2)/fax(length(fax)); 
% plotWd = fax(length(fax));
% im_min = min(min(min(sampleSet))); 
% im_max = max(max(max(sampleSet)));
%IC_FastICA=A';

[m,n] = size(I(:,:,1));
for i =1:samples
B(:,:,i) =abs(reshape(IC_FastICA(i,:),m,n));
  subplot(1,3,i); 
  imshow(B(:,:,i));
end
% imshow(B(:,:,5));% for j = 1:samples
% %     subplot(plotHt,plotWd,j)
% %    subplot(2,4,j); 
% %   imshow(B(:,:,j));
% end
  imwrite(B,'zhaoqing300603ica.tif');
%  