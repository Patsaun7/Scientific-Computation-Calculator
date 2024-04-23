function [] = rootfinding(arg1, arg2, arg3)
  n = ceil(str2double(arg1));
  x_0 = str2double(arg2);
  x_1 = str2double(arg3);
  fprintf("Assume f(x) = 2*x*cos(x) + 3*x*sin(x) - 9.\n")
  fprintf("Executing %d iterations of Newton's method to approximate a root of f(x)\n", n);
  fprintf("with initial guess %.5f.\n", x_0);
  roots1 = newtonsmethod(n, x_0);
  print(roots1);
  fprintf("\nExecuting %d iterations of the Secant method to approximate a root of f(x)\n", n);
  fprintf("with initial guesses %.5f and %.5f.\n", x_0, x_1);
  roots2 = secantmethod(n, x_0, x_1);
  print(roots2);  
end

function [roots] = newtonsmethod(n, x_0)
    roots = zeros(n+1,1); 
    roots(1) = x_0; 
    for k = 2:n+1
        roots(k) = roots(k-1)-f(roots(k-1))/derivative(roots(k-1));
    end
end

function [roots] = secantmethod(n, x_0, x_1)
    roots = zeros(n+2,1);
    roots(1) = x_0;
    roots(2) = x_1;
    for k = 3:n+2
        roots(k) = roots(k-1)-f(roots(k-1))*(roots(k-1)-roots(k-2))/(f(roots(k-1))-f(roots(k-2)));
    end
end

function [value] = f(x)
  value = 2*x*cos(x) + 3*x*sin(x) - 9;
end

function [value] = derivative(x)
  value = 2*cos(x) + 3*sin(x) + 3*x*cos(x) - 2*x*sin(x);
end

function [] = print(roots)
  n = size(roots, 1);
  for i = 1 : 1 : n 
    fprintf("x_%d = %.5f, f(x_%d) = %.5f\n", i-1, roots(i), i-1, f(roots(i)));
  end
end
