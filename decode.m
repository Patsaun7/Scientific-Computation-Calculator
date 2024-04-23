function [] = decode(b)
  n = strlength(b);
  fprintf("Assume %s represents an integer encoded with %i-bit two's complement\n", b, n); 
  x = 0;

  if b(1) == '1'
      for i = 1:n
          if b(i) == '0'
              x = x + 2^(n-i);
          end
      end
      x = (-1*x)-1;
  else
      for i = 1:n
          if b(i) == '1'
              x = x + 2^(n-i);
          end
      end
  end
       
  print(b, x);

end

function [] = print(b, x)
  n = strlength(b);
  fprintf("%s decoded as a base-10 integer is %i \n", b, x);
end
