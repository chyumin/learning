%%
%     COURSE: Dimension reduction and source separation in neuroscience
%    SECTION: Creating and interpreting covariance matrices
%      VIDEO: MATLAB: covariance with simulated data
% Instructor: mikexcohen.com
%
%%

%% simulate data with covariance structure

% simulation parameters
N = 1000;     % time points
M =   20;     % channels
nTrials = 50; % number of trials

% time vector (radian units)
t = linspace(0,6*pi,N);

% initialize data matrices
data = cell(1,2);

% relationship across channels (imposing covariance)
chanrel = sin(linspace(0,2*pi,M))';


% loop over "trials" and generate data
for triali=1:nTrials
    
    % simulation 1
    data{1}(:,:,triali) = bsxfun(@times,repmat( sin(t),M,1 ),chanrel) + randn(M,N);
    
    % simulation 2
    data{2}(:,:,triali) = bsxfun(@times,repmat( sin(t+rand*2*pi),M,1 ),chanrel) + randn(M,N);
end

%% visual inspection of the time series data

figure(1), clf

for i=1:2
    subplot(1,2,i)
    
    % pick a random trial
    trial2plot = ceil(rand*nTrials);
    
    % show the data
    plot(t,bsxfun(@plus, squeeze(data{i}(:,:,trial2plot)) ,(1:M)'*3 ))
    
    % make the plot look a bit nicer
    set(gca,'ytick',[]), axis tight
    xlabel('Time'), ylabel('Channels')
    title([ 'Dataset ' num2str(i) ', trial' num2str(trial2plot) ])
end

%% compute covariance matrix element-wise

% initialize
covmat1 = zeros(M);

% compute the trial average (ERP)
dataave = mean(data{1},3);

% double-loop over channels and compute dot product scaled by N-1
for chani=1:M
    for chanj=1:M
        
        % mean-center data
        subi = dataave(chani,:) - mean(dataave(chani,:));
        subj = dataave(chanj,:) - mean(dataave(chanj,:));
        
        % compute covariance
        covmat1(chani,chanj) = sum( subi.*subj )/ (N-1);
    end % end chanj
end % end chani


%% covariance via matrix multiplication

% first mean-center (over time!)
dataaveM = bsxfun(@minus,dataave,mean(dataave,2));

% all pairwise dot products as the matrix times its transpose
covmat2 = dataaveM*dataaveM' / (N-1);

%% covariance using MATLAB's cov function

% note that cov will mean-center the data
covmat3 = cov(dataave);

% always check the size to make sure it's the correct orientation:
size(covmat3)

%% show the matrices

figure(2), clf

subplot(131), imagesc(covmat1)
axis square, title('Element-wise')
xlabel('Channels'), ylabel('Channels')

subplot(132), imagesc(covmat2)
axis square, title('Matrix multiplication')
xlabel('Channels'), ylabel('Channels')

subplot(133), imagesc(covmat3)
axis square, title('MATLAB cov function')
xlabel('Channels'), ylabel('Channels')

%% discussion

% What are the advantages and disadvantages 
% of each approach to computing the covariance matrix?

%% compare the covariance matrices for the two datasets

[covmat1,covmat2] = deal( zeros(M) );

for triali=1:nTrials
    
    %% dataset 1
    % extract data and mean-center
    tmpdat = squeeze( data{1}(:,:,triali) );
    tmpdat = bsxfun(@minus,tmpdat,mean(tmpdat,2));
    % compute covariance and add to matrix
    covmat1 = covmat1 + tmpdat*tmpdat'/(N-1);
    
    %% dataset 2
    % extract data and mean-center
    tmpdat = squeeze( data{2}(:,:,triali) );
    tmpdat = bsxfun(@minus,tmpdat,mean(tmpdat,2));
    % compute covariance and add to matrix
    covmat2 = covmat2 + tmpdat*tmpdat'/(N-1);
    
end

% finish the averaging
covmat1 = covmat1 / nTrials;
covmat2 = covmat2 / nTrials;

figure(3), clf
clim = [-1 1]*.7; % colormap
subplot(221), imagesc(covmat1)
axis square, title('Dataset 1, trial covars')
set(gca,'clim',clim,'xtick',[],'ytick',[])


subplot(222), imagesc(covmat2)
axis square, title('Dataset 2, trial covars')
set(gca,'clim',clim,'xtick',[],'ytick',[])


%% now repeat for average

% compute average
dataave1 = mean(data{1},3);
dataave2 = mean(data{2},3);

% covariance for data1
tmpdat  = bsxfun(@minus,dataave1,mean(dataave1,2));
covmat1 = tmpdat*tmpdat' / (N-1);

% covariance for data2
tmpdat  = bsxfun(@minus,dataave2,mean(dataave2,2));
covmat2 = tmpdat*tmpdat' / (N-1);


subplot(223), imagesc(covmat1)
axis square, title('Dataset 1, average covar')
set(gca,'clim',clim,'xtick',[],'ytick',[])


subplot(224), imagesc(covmat2)
axis square, title('Dataset 2, average covar')
set(gca,'clim',clim,'xtick',[],'ytick',[])

%% discussion

% Explain the differences in the results!

%%
