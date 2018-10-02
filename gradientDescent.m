% implementing gradient descent algorithm on the linear regression model
function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
	m = length(y);
	J_history = zeros(num_iters,1);

	for iters =1:num_iters

		% formulating the hypothesis
	    H = ((theta')*(X'))';
	    total = H-y;
	    % executing the gradient descent algorithm
	    for i = 1:length(theta)
	        theta(i)= theta(i)- alpha/m*sum(total.*X(:,i));
	    end	

    % save the cost J in every iteration
    J_history = computeCost(X, y, theta);
	end
end
