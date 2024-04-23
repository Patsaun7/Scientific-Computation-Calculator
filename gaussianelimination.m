function [] = gaussianelimination(arg1, arg2)
  A = readmatrix(arg1);
  b = readmatrix(arg2);
  Acopy = A; 
  bcopy = b; 
  fprintf("Executing Gaussian elimination to solve the linear system Ax = b.\n")
  display(A);
  display(b);
  fprintf("Forward elimination\n")
  [A, b] = forwardelimination(A, b);
  display(A);
  display(b);
  fprintf("Backward substitution\n")
  x = backwardsubstitution(A, b);
  display(x);
  fprintf("Residual (error) vector\n")
  r = residualvector(Acopy, x, bcopy);
  display(r);  
end

function [A, b] = forwardelimination(A, b)
    n = size(A, 1);
    for i = 1:n-1
        for j = i+1:n
            scale = A(j, i) / A(i, i);
            A(j, i:n) = A(j, i:n) - scale * A(i, i:n);
            b(j) = b(j) - scale * b(i);
        end
    end
end

function [x] = backwardsubstitution(A, b)
    n = size(A, 1);
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end

function [r] = residualvector(A, x, b)
    r = b - A * x;
end
