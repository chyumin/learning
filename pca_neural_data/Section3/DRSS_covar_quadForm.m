%%
%     COURSE: Dimension reduction and source separation in neuroscience
%    SECTION: Creating and interpreting covariance matrices
%      VIDEO: MATLAB: Visualizing the quadratic form
% Instructor: mikexcohen.com
%
%%

% create a little matrix
A = [1 2; 2 9];

% other interesting matrices to try:
%A = [2 1; 4 2];
%A = [2 1; 1 -1];
%A = [1 0; 0 1];

% weights along each dimension
xi = -2:.1:2;

quadform = zeros(length(xi));
for i=1:length(xi)
    for j=1:length(xi)
        
        % define the weights for this iteration
        x = [xi(i) xi(j)]';
        
        % normalization factor
        normfact = x'*x;
        
        % compute the quadratic form of matrix A
        quadform(i,j) = x'*A*x ;
    end
end

figure(1), clf
% make a rotatable image
surf(xi,xi,quadform'), shading interp
title('Visual representation of quadratic form of matrix A')
xlabel('W1'), ylabel('W2'), zlabel('energy')
rotate3d on


% an aside: the solution vectors to the normalized quadratic form
%           are the eigenvectors of the matrix.
% [evecs,evals] = eig(A);
% hold on
% plot3([0 evecs(1,1)],[0 evecs(2,1)],[1 1]*max(quadform(:)),'w','linew',3)
% plot3([0 evecs(1,2)],[0 evecs(2,2)],[1 1]*max(quadform(:)),'m','linew',3)

%%
