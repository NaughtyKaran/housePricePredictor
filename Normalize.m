% so we need to normalize the features so that computation becomes easier and convenient 
function [X_norm, mu, sigma] = Normalize(X)
 %intializing mean and deviation
 mu = zeros(1, size(X,2));
 sigma = zeros(1, size(X, 2));

 % calculating the mean of  the set
 mu = mean(X);
 % calculating the deviation
 sigma = range(X);

 % normalizing the feautures 
 X_norm = (X- mu)./sigma;
end  