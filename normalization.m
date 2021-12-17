classdef normalization
    methods(Static)
        function [ extractedLetters ] = getLettersFromImage( img )
            beginEndIndex = helperFunctions.getLinesBegEndIndexes(img);
            y = size(beginEndIndex, 1);
            extractedLetters = zeros(1,y);
            for i = 1: y
                beginLine = beginEndIndex(i, 1);
                endLine = beginEndIndex(i, 2);
                
                beginLine = normalization.getLettersFromLine(img(beginLine:endLine, :));
                extractedLetters = (beginLine);
            end
        end

        function [ letters ] = getLettersFromLine( img )
            global regionHeight;
            global regionWidth;
            
            begEndIndexes = helperFunctions.getLettersBegEndIsIndexes(img);
            amountOfLetters = sum(begEndIndexes(:, 3));
            [rows , ~] = size(begEndIndexes);
            letters = ones(regionHeight * regionWidth, amountOfLetters);

            letterIndecols = 1;
            for i = 1: rows
                if begEndIndexes(i, 3) == 1
                    letterImage =  img(:, begEndIndexes(i, 1):begEndIndexes(i, 2));
                    normalizedLetter = normalization.normalizeLetter(letterImage);
                    letters(:, letterIndecols) = normalizedLetter;
                    letterIndecols = letterIndecols + 1;
                end
            end
        end

        function [ normalized ] = normalizeLetter( imgOfLetter )
            global regionHeight;
            global regionWidth;
            framed = zeros(regionHeight, regionWidth);
            
            colSum = sum(imgOfLetter, 1);
            rowSum = sum(imgOfLetter, 2);
            colNotZeroIndexes = find(colSum);
            rowNotZeroIndexes = find(rowSum);
            
            imgOfLetter = imgOfLetter(rowNotZeroIndexes(1): rowNotZeroIndexes(end), colNotZeroIndexes(1): colNotZeroIndexes(end));
            
            resized = imresize(imgOfLetter, [regionHeight - 2 regionWidth - 2]);
            framed(2:end-1, 2:end-1) = resized;
            normalized = framed(:);
        end
    end
end