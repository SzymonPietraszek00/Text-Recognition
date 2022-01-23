%% For image with one line text marks verticals begs and ends of the sign area
%% when it contains letter on index begEndIsLetter(3) will be 1 when white area 0.
function [ begEndIsLetter ] = getLettersBegEndIsIndexes( image )
    begEndIsLetter = [];
    [y, x] = size(image);
    linePixelsSum = sum(image);
    % pick threshold (wheather or not treat line as text line - works but
    % unnessesery
    %     REMOVE_FRACTION = 0.1;
    %     n = uint8(x * REMOVE_FRACTION);
    %     sortedLinePieselsSums = sort(linePixelsSum);
    %     threshold = sortedLinePieselsSums(n);
    threshold = 0;
    
    signStart = 1;
    letterArea = 0;
    for i = 1: x
        % letter under i
        if linePixelsSum(i) > threshold
            % if beg of letter
            if letterArea == 0
                if(i - 1 - signStart) > 0
                    begEndIsLetter = [begEndIsLetter; signStart (i-1) 0];
                end
                signStart = i;  %letter beg
                letterArea = 1;
            end
        else
            if letterArea == 1
                begEndIsLetter = [begEndIsLetter; signStart (i-1) 1];
                letterArea = 0;
                signStart = i;
            end
        end
    end
end