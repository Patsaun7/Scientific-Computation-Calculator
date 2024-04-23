
function [] = naturalToBinary(arg1)
  x = str2num(arg1);
  n = ceil(log2(x+1));
  v = zeros(1, n);
  q = x;
  i = 1;
  while q > 0
      v(i) = mod(q, 2);
      fprintf("%i / 2 = %i r %i\n", q, floor(q / 2), v(i));
      q = floor(q / 2);
      i = i + 1;
  end
  
  v = reverse(v);
  print(x, v);


end

function [output] = reverse(v)
  output = fliplr(v);
  
  
end

function [] = print(x, v)
  fprintf("%i in base-10 is equal to ", x);
  n = size(v, 2); 
  for i = 1 : 1 : n
    fprintf("%i", v(i));
  end
  fprintf(" in binary\n");
end
