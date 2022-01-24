
% For image with one line text marks verticals begs and ends of the sign area
% when it contains letter on index begEndIsLetter(3) will be 1 when white area 0.
function [ begEndIsLetter ] = getLettersBegEndIsIndexes( image )
    begEndIsLetter = [];
    [~, x] = size(image);
    linePixelsSum = sum(image);
    threshold = 0; % white color
    signBeginning = true;
    flag = false;
    for i = 1: x
        if linePixelsSum(i) > threshold
            if flag == false
                if(i - 1 -  signBeginning) > 0
                    begEndIsLetter = [begEndIsLetter;  signBeginning (i-1) 0];
                end
                 signBeginning = i;
                flag = true;
            end
        else
            if flag == true
                begEndIsLetter = [begEndIsLetter;  signBeginning (i-1) 1];
                flag = ~flag;
                 signBeginning = i;
            end
        end
    end
end