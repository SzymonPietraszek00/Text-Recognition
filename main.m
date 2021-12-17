
classdef main
    methods(Static)
        
        function [wordsLength] = calculateWordsLength(isSpace, length)
            wordsLength = [];
            for newWord = isSpace
                if newWord == 0
                    length = length + 1;
                else
                    wordsLength = [wordsLength (length + 1)];
                    length = 0;
                end
            end
            
            if length > 0
                wordsLength = [wordsLength (length + 1)];
            end
        end
        function [isSpace] = checkIsSpaces(spaces)
            isSpace = [];
            for space = spaces
                diffFromMin = abs(space - min(spaces));
                diffFromMax = abs(space - max(spaces));
                if diffFromMax < diffFromMin
                    isSpace = [isSpace true];
                else
                    isSpace = [isSpace false];
                end
            end
            
        end
        function [ textLine ] = decryptSingleLineText( readCode, lineImage )
            global codeLen;
            global code;
            
            toDecryptLetters = normalization.getLettersFromLine(lineImage);
            wordsLength = helperFunctions.getWordsLengthFromLine(lineImage);
            y = size(toDecryptLetters, 2);
            letters = [];
            
            for i = 1:y
                withLetter = [readCode toDecryptLetters(:,i)];
                convergenceArray = corrcoef(withLetter); % Correlation coefficients
                dist = pdist(convergenceArray');
                odl = squareform(dist);
                last = odl(1:codeLen, codeLen + 1);
                [~, index] = min(last);
                letters = [letters code(index)];
                withLetter = withLetter(:,codeLen);
            end
            
            textLine = [];
            it = 1;
            for wordLen = wordsLength
                textLine = [textLine letters(1, it:it + wordLen - 1) ' '];
                it = it + wordLen;
            end
        end
        function [ text ] = decryptText( codeNormalized, textImage)
            begEndLinesYIndexes = helperFunctions.getLinesBegEndIndexes(textImage);
            [y, ~] = size(begEndLinesYIndexes);
            text = '';
            for i = 1: y
                lineStartYIndex = begEndLinesYIndexes(i, 1);
                lineEndYIndex = begEndLinesYIndexes(i, 2);
                line = main.decryptSingleLineText(codeNormalized, textImage(lineStartYIndex:lineEndYIndex, :));
                text = sprintf('%s%s%s',text, newline, line);
            end
        end
        
        
    end
end