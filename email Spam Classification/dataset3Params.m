function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
C_list     = [0.01 0.03 0.1 0.3 1 3 10 30]';
   sigma_list = [0.01 0.03 0.1 0.3 1 3 10 30]';
   
   prediction_error = zeros(length(C_list), length(sigma_list));
   for i = 1:length(C_list)
       for j = 1: length(sigma_list)
           C_test = C_list(i);
           sigma_test = sigma_list(j);
           model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
           predictions = svmPredict(model, Xval);
           prediction_error(i,j) = mean(double(predictions ~= yval));
       end
   end
   
   % Finding row and col corresponding to min(prediction_error)
   [values, row_index]=min(prediction_error);
   [~ ,col] = min(values);
   row = row_index(col);
   
   % C and sigma corresponding to min(prediction_error)
   C = C_list(row);
   sigma = sigma_list(col);
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







% =========================================================================

end
