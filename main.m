function main()
    while true
        choice = menu('Choose a task or quit the program:', ...
            'Natural Number to Binary', ...
            'Decode Two''s Complement Bit String', ...
            'Vector Operations', ...
            'Matrix Multiplication', ...
            'Rotate 2D Vectors', ...
            'Matrix Analysis', ...
            'Gaussian Elimination', ...
            'Root Finding (Newton and Secant Methods)', ...
            'Interpolation (Custom Task)', ...
            'Lagrange Polynomial Interpolation', ...
            'Quit Program');

        % Switch case to handle task selection
        switch choice
            case 1
                naturalToBinaryTask();
            case 2
                decodeTask();
            case 3
                vectorsTask();
            case 4
                matrixmultiplyTask();
            case 5
                rotationTask();
            case 6
                typeofmatrixTask();
            case 7
                gaussianeliminationTask();
            case 8
                rootfindingTask();
            case 9
                interpolationTask(); % Assuming custom task is using interpolation.m
            case 10
                lagrangeTask();
            case 11
                disp('Quitting program.');
                return; % Exit the program
        end
    end
end

% Task-specific functions
function runTask(taskFunctionName)
    inputType = questdlg('Select input type', 'Input Type', 'String', 'File', 'String');
    tempFile = 'temp_output.txt';

    switch inputType
        case 'String'
            userInput = inputdlg('Enter the string:', 'String Input');
            if isempty(userInput)
                disp('Input canceled.');
                return;
            end
            diary(tempFile);
            feval(taskFunctionName, userInput{1});
            diary off;
        case 'File'
            [fileName, filePath] = uigetfile('*.txt', 'Select Text File');
            if fileName == 0
                disp('File selection canceled.');
                return;
            end
            fileContent = fileread(fullfile(filePath, fileName));
            diary(tempFile);
            feval(taskFunctionName, fileContent);
            diary off;
    end
    printedData = fileread(tempFile);
    writeToOutputFile('output.txt', printedData);
    delete(tempFile);
end



function runTaskMatrix(taskFunctionName)
    inputType = questdlg('Select input type', 'Input Type', 'String', 'File', 'String');
    tempFile = 'temp_input.txt'; 
    outputTempFile = 'temp_output.txt'; 

    switch inputType
        case 'String'
            % Prompt the user for input
            prompt = {'Enter the string. (Matrixes should be formatted as follows: [1,2,3;4,5,6;7,8,9] Rows are seperated by a semicolon.)'};
            dlgtitle = 'String Input';
            userInput = inputdlg(prompt, dlgtitle);
            if isempty(userInput)
                disp('Input canceled.');
                return;
            end
            
            % Reformat the input string
            inputString = userInput{1};
            inputString = strrep(inputString, ';', sprintf('\n'));
            inputString = strrep(inputString, '[', '');
            inputString = strrep(inputString, ']', '');
            
            % Write the reformatted input to a temporary file
            fid = fopen(tempFile, 'w');
            if fid == -1
                disp('Error creating temporary file.');
                return;
            end
            fprintf(fid, '%s\n', inputString);
            fclose(fid);
            
            % Capture the output of the task function using diary
            diary(outputTempFile);
            feval(taskFunctionName, tempFile);
            diary off;
        case 'File'
            [fileName, filePath] = uigetfile('*.txt', 'Select Text File');
            if fileName == 0
                disp('File selection canceled.');
                return;
            end
            
            % Capture the output of the task function using diary
            diary(outputTempFile);
            feval(taskFunctionName, fullfile(filePath, fileName));
            diary off;
    end
    
    % Read the captured output from the temporary file
    printedData = fileread(outputTempFile);
    
    % Write the output to the output file
    writeToOutputFile('output.txt', printedData);
    
    % Delete the temporary files
    delete(tempFile);
    delete(outputTempFile);
end



function runTaskTwoMatrix(taskFunctionName)
    tempFile1 = 'temp_input_1.txt';
    tempFile2 = 'temp_input_2.txt';
    outputTempFile = 'temp_output.txt';

    inputStrings = cell(2, 1);

    for i = 1:2 
        inputType = questdlg(['Select input type for matrix ', num2str(i)], 'Input Type', 'String', 'File', 'String');
        
        switch inputType
            case 'String'
                prompt = {['Enter the string for matrix ', num2str(i), '. (Matrixes should be formatted as follows: [1,2,3;4,5,6;7,8,9] Rows are separated by a semicolon.)']};
                dlgtitle = 'String Input';
                userInput = inputdlg(prompt, dlgtitle);
                if isempty(userInput)
                    disp('Input canceled.');
                    return;
                end
                
                inputString = userInput{1};
                inputString = strrep(inputString, ';', sprintf('\n'));
                inputString = strrep(inputString, '[', '');
                inputString = strrep(inputString, ']', '');
                
                inputStrings{i} = inputString;
                
            case 'File'
                [fileName, filePath] = uigetfile('*.txt', ['Select Text File for matrix ', num2str(i)]);
                if fileName == 0
                    disp('File selection canceled.');
                    return;
                end
                
                fileContent = fileread(fullfile(filePath, fileName));
                inputStrings{i} = fileContent;
        end
    end
    
    fid1 = fopen(tempFile1, 'w');
    fid2 = fopen(tempFile2, 'w');
    if fid1 == -1 || fid2 == -1
        disp('Error creating temporary files.');
        return;
    end
    fprintf(fid1, '%s\n', inputStrings{1});
    fprintf(fid2, '%s\n', inputStrings{2});
    fclose(fid1);
    fclose(fid2);
    
    diary(outputTempFile);
    feval(taskFunctionName, tempFile1, tempFile2);
    diary off;

    printedData = fileread(outputTempFile);
    
    writeToOutputFile('output.txt', printedData);
    
    delete(tempFile1);
    delete(tempFile2);
    delete(outputTempFile);
end



function runTaskThreeStrings(taskFunctionName)
    tempFile = 'temp_output.txt';

    inputs = cell(1, 3);  % Initialize cell array to store inputs

    for i = 1:3
        inputType = questdlg('Select input type', 'Input Type', 'String', 'File', 'String');

        switch inputType
            case 'String'
                userInput = inputdlg('Enter the string:', 'String Input');
                if isempty(userInput)
                    disp('Input canceled.');
                    return;
                end
                inputs{i} = userInput{1};  % Store the input in the cell array
            case 'File'
                [fileName, filePath] = uigetfile('*.txt', 'Select Text File');
                if fileName == 0
                    disp('File selection canceled.');
                    return;
                end
                fileContent = fileread(fullfile(filePath, fileName));
                inputs{i} = fileContent;  % Store the file content in the cell array
        end
    end

    diary(tempFile);
    feval(taskFunctionName, inputs{:});  
    diary off;

    printedData = fileread(tempFile);
    writeToOutputFile('output.txt', printedData);
    delete(tempFile);
end



function runTaskMixed(taskFunctionName)
    inputType = questdlg('Select input type for the matrix', 'Input Type', 'String', 'File', 'String');
    tempFile1 = 'temp_input1.txt'; 
    tempFile2 = 'temp_input2.txt'; 
    outputTempFile = 'temp_output.txt'; 

    % First iteration for the first argument
    switch inputType
        case 'String'
            userInput = inputdlg('Enter the matrix: (Matrixes should be formatted as follows: [1,2,3;4,5,6;7,8,9] Rows are separated by a semicolon.)', 'String Input');
            if isempty(userInput)
                disp('Input canceled.');
                return;
            end
            
            fid = fopen(tempFile1, 'w');
            if fid == -1
                disp('Error creating temporary file.');
                return;
            end
            fprintf(fid, '%s\n', userInput{1});
            fclose(fid);
        case 'File'
            [fileName, filePath] = uigetfile('*.txt', 'Select Text File for the matrix');
            if fileName == 0
                disp('File selection canceled.');
                return;
            end
            
            copyfile(fullfile(filePath, fileName), tempFile1);
    end
    
    % Second iteration for the second argument
    inputType = questdlg('Select input type for the rotation degrees', 'Input Type', 'String', 'File', 'String');
    switch inputType
        case 'String'
            userInput = inputdlg('Enter the string for the rotation degrees:', 'String Input');
            if isempty(userInput)
                disp('Input canceled.');
                return;
            end
            
            diary(outputTempFile);
            feval(taskFunctionName, tempFile1, userInput{1});
            diary off;
        case 'File'
            [fileName, filePath] = uigetfile('*.txt', 'Select Text File for the rotation degrees');
            if fileName == 0
                disp('File selection canceled.');
                return;
            end
            
            copyfile(fullfile(filePath, fileName), tempFile2);
            
            diary(outputTempFile);
            feval(taskFunctionName, tempFile1, tempFile2);
            diary off;
    end
    
    printedData = fileread(outputTempFile);
    
    writeToOutputFile('output.txt', printedData);
    
    delete(tempFile1);
    delete(tempFile2);
    delete(outputTempFile);
end


function naturalToBinaryTask()
    runTask('naturalToBinary');
end

function decodeTask()
    runTask('decode');
end

function vectorsTask()
    runTaskTwoMatrix('vectors');
end

function matrixmultiplyTask()
    runTaskTwoMatrix('matrixmultiply');
end

function rotationTask()
    runTaskMixed('rotation');
end

function typeofmatrixTask()
    runTaskMatrix('typeofmatrix');
end

function gaussianeliminationTask()
    runTaskTwoMatrix('gaussianelimination');
end

function rootfindingTask()
    runTaskThreeStrings('rootfinding');
end

function interpolationTask()
    runTaskMatrix('interpolation');
end

function lagrangeTask()
    runTaskMatrix('lagrange');
end



% Utility function to write to output file
function writeToOutputFile(outputFile, dataStr)
    outputFileID = fopen(outputFile, 'w');
    if outputFileID == -1
        disp('Error opening output file.');
        return;
    end
    
    fprintf(outputFileID, '%s\n', dataStr);
    
    fclose(outputFileID);

    disp(['Output written to ', outputFile]);
end

