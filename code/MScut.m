%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [DRGB, DSD, MSSD] = MScut(sMode, RGB_raw, hs, hf, m )
% designed for segmenting a colour image using mean-shift [ComaniciuMeer 2002]
% image must be color
% procedure in mean-shift
% 1. combine support space and feature space to make a mean-shift space
%    based data description
% 2. for every mean-shift space data
% 3.   do mean-shift filtering
%      until convergence
% 4. end
% 5. find the converged mean-shift space data that you are interested in
%    and label it
% 6. repeat the above steps
%
% a     -- data in support space
% b     -- data in feature space
% x     -- data in mean-shift space
% f(.)  -- data density function
% k(.)  -- profile function (implicit)
% g(.)  -- profile function (explicit)
% m     -- mean shift vector
% hs    -- bandwidth in support space
% hf    -- bandwidth in feature space
% M     -- threshold to make a distinct cluster
%% enter $hs$, $hf$, $m$ if necessary
if ~exist('hs')
    hs = input('please enter spatial bandwidth (hs):\n');
end
if ~exist('hf')
    hf = input('please enter feature bandwidth (hf):\n');
end
if ~exist('m')
    m = input('please enter minimum cluster size (m):\n');
end
switch upper(sMode)
    case 'RGB'
        RGB = double( RGB_raw );
    case 'gray'
        error('FCMcut must use colored image to do segmentation!')
end
sz = size(RGB);
mTCUT = Tcut( RGB(:,:,1) ); % trivial segmentation

%% project data into mean-shift space to make $MSSD$ (mean-shift space data)
mT = repmat([1:sz(1)]', 1, sz(2));
vX = mT(1:end)';             % row
mT = repmat([1:sz(2)], sz(1), 1);
vY = mT(1:end)';  % column
mT = RGB(:,:,1);
vR = mT(1:end)'; % red
mT = RGB(:,:,2);
vG = mT(1:end)'; % green
mT = RGB(:,:,3);
vB = mT(1:end)'; % blue
MSSD = [vX, vY, vR, vG, vB];
%% make $g$ - explicit profile function
disp('Using flat kernel: Epanechnikov kernel...')
g_s = ones(2*hs+1, 2); % 's' for support space
g_f = ones(2*hf+1, 3); % 'f' for feature space
%% main part $$
nIteration = 4;
nData   = length(MSSD); % total number of data
DSD     = MSSD*0; % 'DSD' for destination space data
for k = 1:nData
    %
    tMSSD = MSSD(k,:); % 't' for temp
    for l = 1:nIteration
        %
        mT = abs( MSSD - repmat(tMSSD, nData, 1));
        vT = logical( (mT(:,1)<=hs).*(mT(:,2)<=hs).*(mT(:,3)<=hf).*(mT(:,4)<=hf).*(mT(:,5)<=hf) );
        v  = MSSD(vT,:);
        % update $tMSSD$
        tMSSD = mean( v, 1 );
        if nIteration == l
            DSD(k,:) = tMSSD;
        end
    end
end
% show result
DRGB = RGB * 0;
DRGB(:,:,1) = reshape(DSD(:,3), sz(1), sz(2)); % red
DRGB(:,:,2) = reshape(DSD(:,4), sz(1), sz(2)); % red
DRGB(:,:,3) = reshape(DSD(:,5), sz(1), sz(2)); % red

figure, imshow(uint8(DRGB), [])