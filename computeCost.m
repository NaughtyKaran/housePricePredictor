% calculating the cost function for linear regression
function J = computeCost(X, y, theta)
	m = length(y);

	%intializing the cost
	J =0;

	%computing the cost
	H = ((theta')*(X'))';
	compute = (H-y).^2;
	result = sum(compute);
	J = (1/(2*m))*result;
end
