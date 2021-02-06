function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%% Code used to get the best combination of C and Sigma
%% Got C = 1.00 and Sigma = 0.10
%{
cVec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaVec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
error = 1;

for c=cVec
  for s=sigmaVec
    fprintf('Running for C: %.2f, Sigma: %.2f', c, s);
    model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));
    p = svmPredict(model, Xval);
    new_error = mean(double(p ~= yval));
    if new_error < error
      error = new_error;
      C = c;
      sigma = s;
  end
end

fprintf('Best C, sigma: %.2f, %.2f', C, sigma);
%}
C = 1.00;
sigma = 0.10;
% =========================================================================

end
