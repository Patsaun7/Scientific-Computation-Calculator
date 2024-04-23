function [] = lagrange(arg1)
  format short;
  C = readmatrix(arg1);
  n = size(C, 2);
  fprintf("Assume p(x) is a polynmial function of degree %i that interpolates the \n2D coordinates in C using Lagrange polynomial interpolation form.\n", (n-1));
  display(C);
  fprintf("The coefficients of p(x) are stored in L below.\n");
  L = lagrangecoefficients(C);
  display(L);
  fprintf("The Lagrange polynomial interpolation form for p(x) is below.\n\n"); 
  print(L, C);
end

function [L] = lagrangecoefficients(C)
    n = size(C,2);
    L = zeros(n,1);

    for i = 1:n
        xi = C(1,i); 
        yi = C(2,i); 
        p = 1;
        for j = 1:n
            if j ~= i
                xj = C(1,j);
                p = p * (xi-xj);
            end
        end
        L(i) = yi / p;
    end
end

function [] = print(L, C)
  n = size(C, 2);
  fprintf("p(x) = ");
  for i = 1 : 1 : n
    if(i == 1)
      fprintf("%.4f", L(i));
    end
    if(i > 1)
      fprintf("       %.4f", L(i));
    end
    for j = 1 : 1 : n
      xj = C(1, j);
      if( (j ~= i) && (xj >= 0) )
        fprintf("(x-%.4f)", xj);
      end
      if( (j ~= i) && (xj < 0) )
        xj = -xj;
        fprintf("(x+%.4f)", xj);
      end
    end
    if( (n > 1) && (i ~= n) )
      fprintf(" + \n");
    end
  end
  fprintf("\n\n");
end
