This MATLAB program provides a collection of mathematical tools, including functions for Natural Number to Binary, Decode Two''s Complement Bit String, Vector Operations, Matrix Multiplication, Rotating 2D Vectors, Matrix Analysis, Gaussian Elimination, Root Finding (Newton and Secant Methods), Interpolation, Lagrange Polynomial Interpolation

How to use:
Run the program by executing the main function in MATLAB.
Choose your desired mathematical task from the GUI menu.
Either enter a string or file input as prompted.
If entering a matrix, it should be formatted with the entire matrix surrounded by brackets and each row seperated by a semicolon.
Example: [1,2,3;4,5,6;7,8,9] coresponds to
1,2,3
4,5,6
7,8,9
Repeat for as many tasks as you'd like, or hit 'quit program' button to stop.

Functionality:
A switch statement is used to let the user select the desired task from the menu. Depending on what they select,
different functions will be called to execute those tasks. This includes runTask, runTaskMatrix, runTaskTwoMatrix, 
runTaskMixed, and runTaskThreeStrings. The function that is used depends on the input that the task requires.
All of these functions first allow the user to select between a string or file input. runTask passes the user's
string input directly to the function, and for file input, the file is read, stored as a string, and passed to the
function. runTaskMatrix takes the user's string input and reformats it. The reformatted input is then written to a 
temporary file which will be passed to the selected function. If the user selects file input, the name of the file
will be stored and directly passed to the function. runTaskTwoMatrix, runTaskMixed, and runTaskThreeStrings operate
in the same manner just described, but for more iterations or for a combination of techniques. For all of these functions,
when evaluating the user's selected task, the diary is activated, printed output is stored in a variable, and then written
to the output.txt file. 

