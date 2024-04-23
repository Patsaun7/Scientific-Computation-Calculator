function [B] = rotation(arg1, arg2)
  
  A = readmatrix(arg1); 
  theta = round(str2double(arg2)); 
  
  disp('A =');
  disp(A);
  thetaRadians = deg2rad(theta);
  rotationMatrix = [cos(thetaRadians) -sin(thetaRadians); sin(thetaRadians) cos(thetaRadians)];    
  B = rotationMatrix * A;
  disp('B =');
  disp(B);
  x = A(1, :);
  y = A(2, :);
  xNew = B(1, :);
  yNew = B(2, :);  
  scatter(x, y, 'black', 'filled');
  hold on;

  scatter(xNew, yNew, 'blue', 'filled'); 
  
  legendOutput =  ['vectors in A', compose('vectors in A rotated by %i degrees ccw', theta)];
  legend(legendOutput);  
  xlabel('x');
  ylabel('y');
  axis equal;
  
  axis([-5 5 -5 5]);
  
  xticks(-5:1:5);
  yticks(-5:1:5);
  
  hold off;
  
  figureHandle = gcf;
  inputFile = split(arg1, '.'); %split fileName based on .
  outputFile = char(strcat(inputFile(1), '_', arg2, '_output.png'));
  fprintf("Exporting %s to current working directory\n", outputFile);
  fprintf("Please ignore any Matlab warnings\n", outputFile);
  exportgraphics(figureHandle, outputFile);
end

