%% For image with one line text marks verticals begs and ends of the sign area
%% when it contains letter on index begEndIsLetter(3) will be 1 when white area 0.
function [ begEndIsLetter ] = getLettersBegEndIsIndexes( image )
    begEndIsLetter = [];
    [~, x] = size(image);
    linePixelsSum = sum(image);
    threshold = 0;
    
     signBeginning = 1;
    letterArea = 0;
    for i = 1: x
        % letter under i
        if linePixelsSum(i) > threshold
            % if beg of letter
            if letterArea == 0
                if(i - 1 -  signBeginning) > 0
                    begEndIsLetter = [begEndIsLetter;  signBeginning (i-1) 0];
                end
                 signBeginning = i;  %letter beg
                letterArea = 1;
            end
        else
            if letterArea == 1
                begEndIsLetter = [begEndIsLetter;  signBeginning (i-1) 1];
                letterArea = 0;
                 signBeginning = i;
            end
        end
    end
end