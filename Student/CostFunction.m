function J = CostFunction (theta, X, y)
  m = size(X,1);
  
  J = sum((X * theta - y).^2) / m / 2;  
endfunction
