function [] = vectors(arg1, arg2)
  x = readmatrix(arg1);
  y = readmatrix(arg2);
  n = size(x, 2); 
  printvector(x, "x");
  printvector(y, "y");
  if( size(y, 2) ~= n )
    fprintf("Error: vectors x and y must have the same number of elements.\nGoodbye.\n");
    return;
  end
  m1 = magnitude(x);
  fprintf("|x| = %f\n", m1);
  m2 = magnitude(y);
  fprintf("|y| = %f\n", m2);  
  d = dotproduct(x, y);  
  fprintf("x.y = %f\n", d);
  theta = angle(x, y);
  fprintf("theta = %f radians = %f degrees\n", theta, radiantodegree(theta));
  if(isperpendicular(x, y) == 1)
    fprintf("x and y are perpendicular\n");
  else
    fprintf("x and y are NOT perpendicular\n");
  end
  if(isparallel(x, y) == 1)
    fprintf("x and y are parallel\n");
  else
    fprintf("x and y are NOT parallel\n");
  end
end

function [] = printvector(v, label)
  fprintf("%s = [", label);
  n = size(v, 2);
  for i = 1 : n-1
    fprintf("%f, ", v(i));
  end
  fprintf("%f]\n", v(n));
end

function [m] = magnitude(v)
  n = size(v, 2);
  m = 0;
  for i = 1:n
    m = m + v(i)^2;
  end
  m = sqrt(m);
end


function [d] = dotproduct(x, y)
  n = size(x, 2);
  d = 0;
  for i = 1:n
    d = d + x(i) * y(i);
  end
end


function [theta] = angle(x, y)
  dotProd = dotproduct(x, y);
  magX = magnitude(x);
  magY = magnitude(y);
  theta = acos(dotProd / (magX * magY));
end

function [d] = radiantodegree(r)
  d = r * (180 / pi);
end

function [p] = isperpendicular(x, y)
  e = 2^(-23);
  dotProd = dotproduct(x, y);
  p = abs(dotProd) < e;
end

function [p] = isparallel(x, y)
  e = 2^(-23);
  t = angle(x, y);
  p = abs(t) < e || abs(t - pi) < e;
end

