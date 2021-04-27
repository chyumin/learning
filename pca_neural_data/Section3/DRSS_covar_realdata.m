%%
%     COURSE: Dimension reduction and source separation in neuroscience
%    SECTION: Creating and interpreting covariance matrices
%      VIDEO: MATLAB: covariance with real data
% Instructor: mikexcohen.com
%
%%

% load data
load sampleEEGdata

%% average of single-trial covariances

% specify time window (ms) for covariance matrix
tidx = dsearchn( EEG.times',[0 800]');

% loop over trials and compute covariance for each trial
covmatT = zeros( EEG.nbchan );
for triali=1:EEG.trials
    
    % data from this trial and time window
    tmpdat = EEG.data(:,tidx(1):tidx(2),triali);
    % mean-center
    tmpdat = bsxfun(@minus,tmpdat,mean(tmpdat,2));
    % covariance
    covmatT = covmatT + tmpdat*tmpdat'/diff(tidx);
end

% divide by N
covmatT = covmatT/EEG.trials;

%% covariance of trial average

% trial average
erp = squeeze(mean(EEG.data(:,tidx(1):tidx(2),:),3));

% mean-center and covariance
tmpdat = bsxfun(@minus,erp,mean(erp,2));
covmatA = tmpdat*tmpdat'/diff(tidx);

%% show the covariance matrices

clim = [-1 1]*100;

figure(1), clf
subplot(121)
imagesc(covmatT), axis square
set(gca,'clim',clim)
xlabel('Channels'), ylabel('Channels')
title('Average of covariances')


subplot(122)
imagesc(covmatA), axis square
set(gca,'clim',clim)
xlabel('Channels'), ylabel('Channels')
title('Covariance of average')

%%
