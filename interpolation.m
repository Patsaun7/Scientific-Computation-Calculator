function [] = interpolation(arg1)
  C = readmatrix(arg1);
  fprintf("Polynomial interpolation using the Vandermonde matrix for the 2D coordinates in C.\n");
  display(C);
  fprintf("Computing the Vandermonde matrix V.\n");
  V = vandermondematrix(C);
  display(V);
  fprintf("Storing the y-coordinates in C in b.\n");
  b = ycoordinates(C);
  display(b);
  fprintf("Using Gaussian elemination to solve the linear system Va = b.\n");
  a = gaussianelimination(V, b);
  display(a);
  n = size(a, 1);
  fprintf("Interpolating polynomial p(x) is below.\n");
  if(n == 1)
    fprintf("p(x) = %.4f\n", a(1));
  else
    fprintf("p(x) = %.4f + ", a(1));
    for i = 2 : 1 : (n-1)
      fprintf("%.4f*x^%d + ", a(i), (i-1)); 
    end
    fprintf("%.4f*x^%d\n", a(n), (n-1));
  end    
end

function [V] = vandermondematrix(C)
    n = size(C,2);
    V = zeros(n); 
    for i = 1:n
        for j = 1:n
            V(i,j) = C(1,i)^(j-1);
        end
    end
end

function [b] = ycoordinates(C)
    n = size(C,2); 
    b = zeros(n,1); 
    for i = 1:n
        b(i) = C(2,i); 
    end
end

function [x] = gaussianelimination(A, b)
    n = size(A,1);
    x = zeros(n,1); 
    for i = 1:n-1
        for j = i+1:n
            factor = A(j,i)/A(i,i);
            for k = i:n
                A(j,k) = A(j,k)-factor*A(i,k);
            end
            b(j) = b(j)-factor*b(i);
        end
    end
    x(n) = b(n)/A(n,n);
    for i = n-1:-1:1
        sum = b(i);
        for j = i+1:n
            sum = sum-A(i,j)*x(j);
        end
        x(i) = sum/A(i,i);
    end
end

