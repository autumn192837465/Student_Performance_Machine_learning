function [theta,J_history] = GradientDescent (X, y, theta, alpha, iter)
  
  m = size(X,1);
  J_history = zeros(iter,1);
  
  for i = 1:iter
    theta = theta - alpha .* X' * (X * theta - y) / m;   
    J_history(i) = CostFunction(theta,X,y);    
    
    if(mod(i,1000) == 0)
      fprintf("Iterator : %d   Cost : %f!...\n",i,J_history(i))
    end
  end
  
endfunction
