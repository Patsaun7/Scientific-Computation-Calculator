 function [P] = matrixmultiply(arg1, arg2)

  A = readmatrix(arg1); 
  B = readmatrix(arg2); 
  n = size(A,1);
  
  m = size(A,2);
  
  r = size(B,2);

  if( m ~= size(B, 1) )
    fprintf("Error: Multiplication is undefined for A and B.\nGoodbye.\n");
    return;
  end
  
  fprintf("A =\n");
  disp(A);

  fprintf("B =\n");
  disp(B);
  
  fprintf("Assume AB = P.\n");
  fprintf("Dot product(s) for calculating P:\n");
  
  P = zeros(n,r);
  
for i = 1:n
    for j = 1:r
        rowA = A(i, :);
        colB = B(:, j);
        P(i, j) = dotproduct(rowA, colB);
        fprintf("P(%i, %i) = ", i, j);
        printvectors(rowA, colB);
        fprintf(" = %.4f\n", P(i, j));
    end
end
  
    fprintf("P =\n");
    disp(P);
end

function [d] = dotproduct(x, y)
    d = 0;
    
    if length(x) ~= length(y)
        fprintf("Entered vectors are not the same length.");
    end
    
    for i = 1:length(x)
        d = d + x(i) * y(i);
    end


end

function [] = printvectors(u, v)
  n = size(u, 2); 
  fprintf("[");
  for i = 1 : n-1
    fprintf("%.4f ", u(i));
  end
  
  fprintf("%.4f].", u(n));

  fprintf("[");  
  m = size(v, 1); 
  for i = 1 : m-1
    fprintf("%.4f ", v(i));
  end
  fprintf("%.4f]", v(m));
end
