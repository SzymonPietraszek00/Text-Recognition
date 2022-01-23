%% Returns info where line starts and ends. Each row is for one line
function [ lines ] = getLinesBegEndIndexes(textImage)   
    lines = [];
    [y, x] = size(textImage);
    linePixelsSum = sum(textImage');
    % pick threshold (wheather or not treat line as text line - works but
    % unnessesery
    %     REMOVE_FRACTION = 0.1;
    %     n = uint8(x * REMOVE_FRACTION);
    %     sortedLinePieselsSums = sort(linePixelsSum);
    %     threshold = sortedLinePieselsSums(n);
    threshold = 0;
    
    lineStart = 0;
    lineArea = 0;
    for i = 1: y
        if linePixelsSum(i) > threshold
            if lineArea == 0
                lineStart = i;
                lineArea = 1;
            end
        else
            if lineArea == 1
                lines = [lines; lineStart i];
                lineArea = 0;
            end
        end
    end
end

