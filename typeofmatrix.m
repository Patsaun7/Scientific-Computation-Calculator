function [] = typeofmatrix(arg1)
  A = readmatrix(arg1); 
  display(A);
  print("issquare(A)", issquare(A));
  print("isdiagonal(A)", isdiagonal(A));
  print("isidentity(A)", isidentity(A));
  print("isuppertriangular(A)", isuppertriangular(A));
  print("islowertriangular(A)", islowertriangular(A));
  print("iszero(A)", iszero(A));
end

function [output] = issquare(A)
    [rows, cols] = size(A);
    output = (rows == cols);
end

function [output] = isdiagonal(A)
    [rows, cols] = size(A);
    if ~issquare(A)
        output = false;
        return;
    end
    for i = 1:rows
        for j = 1:cols
            if i ~= j && A(i, j) ~= 0
                output = false;
                return;
            end
        end
    end
    output = true;
end

function [output] = isidentity(A)
    [rows, cols] = size(A);
    if ~issquare(A)
        output = false;
        return;
    end
    for i = 1:rows
        for j = 1:cols
            if (i == j && A(i, j) ~= 1) || (i ~= j && A(i, j) ~= 0)
                output = false;
                return;
            end
        end
    end
    output = true;
  
end

function [output] = isuppertriangular(A)
    [rows, cols] = size(A);
    if ~issquare(A)
        output = false;
        return;
    end
    for i = 2:rows
        for j = 1:i-1
            if A(i, j) ~= 0
                output = false;
                return;
            end
        end
    end
    output = true;
end

function [output] = islowertriangular(A)
    [rows, cols] = size(A);
    if ~issquare(A)
        output = false;
        return;
    end
    for i = 1:rows-1
        for j = i+1:cols
            if A(i, j) ~= 0
                output = false;
                return;
            end
        end
    end
    output = true;
end
 
function [output] = iszero(A)
    [rows, cols] = size(A);
    for i = 1:rows
        for j = 1:cols
            if A(i, j) ~= 0
                output = false;
                return;
            end
        end
    end
    output = true;
end

function [] = print(label, logicalValue)
  if(logicalValue == true)
    fprintf("%s: true\n", label);
  else
    fprintf("%s: false\n", label);
  end
end
