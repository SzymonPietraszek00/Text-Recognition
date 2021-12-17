classdef helperFunctions
    methods(Static)
        
        function [ begEndIsLetter ] = getLettersBegEndIsIndexes( image )
            begEndIsLetter = [];
            [~, x] = size(image);
            linePixelsSum = sum(image);
            threshold = 0; 
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
        function [ lines ] = getLinesBegEndIndexes(textImage)
            
            [y, x] = size(textImage);

            linePixelsSum = sum(ctranspose(textImage));

            threshold = 0;
            startOfLineIndex = 0;
            flag = 0;

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
        
        function [ wordsLength ] = getWordsLengthFromLine( img )
            
            beginEndIndexes = helperFunctions.getLettersBegEndIsIndexes(img);
            beginEndIndexes = [beginEndIndexes (beginEndIndexes(:, 2) - beginEndIndexes(:, 1))];
            
            if beginEndIndexes(1, 3) == 0
                beginEndIndexes = beginEndIndexes(2:end, :);
            end
            
            signsAmount =  size(beginEndIndexes, 1);
            countSpaces = 0;
            spaces = [];
            for i = 1: signsAmount
                if  beginEndIndexes(i, 3) == 0
                    countSpaces = countSpaces + 1;
                    spaces(end + 1) = beginEndIndexes(i, 4);
                end
            end
            
            isSpace = main.checkIsSpaces(spaces);
            wordsLength = main.calculateWordsLength(isSpace,0);
        end
        
        
        function [ image ] = readImage( file )
            image = imread(file);
            image = ~im2bw(image);
            image = bwlabel(image);
        end
        
        
    end
end