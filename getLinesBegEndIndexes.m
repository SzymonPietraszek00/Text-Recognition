% Returns info where line starts and ends. Each row is for one line
function [ lines ] = getLinesBegEndIndexes(textImage)   

    [y, x] = size(textImage);
%     fprintf('Size of image x %d\n', x);
%     fprintf('Size of image y %d\n', y);
%     if we transpose matrix with pixels we can easily detect end of letter. It happens when the sum is equals zero
    linePixelsSum = sum(ctranspose(textImage));
%     fprintf('Line piselx smu = %d\n', linePixelsSum);
    threshold = 0;
    startOfLineIndex = 0;
    flag = 0;
    
%     We look for first and another occuring 0 value of sum of Pixels to
%     detect lines and store data in array
    lines = [];
    for i = 1: y
        if linePixelsSum(i) > threshold
            if flag == false
                startOfLineIndex = i;
                flag = true;
            end
        else
            if flag == true
                lines = [lines; startOfLineIndex i];
                flag = ~flag;
            end
        end
    end
end

