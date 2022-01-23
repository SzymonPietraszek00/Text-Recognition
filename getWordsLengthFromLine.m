function [ wordsLength ] = getWordsLengthFromLine( SL_Image )
    wordsLength = [];
    
    begEndIsIndexes = getLettersBegEndIsIndexes(SL_Image);
    
    %add 4 column with sign width
    begEndIsIndexes = [begEndIsIndexes (begEndIsIndexes(:, 2) - begEndIsIndexes(:, 1))];
    %remove first sign is white sign
    if begEndIsIndexes(1, 3) == 0
        begEndIsIndexes = begEndIsIndexes(2:end, :);
    end

    signsAmount =  size(begEndIsIndexes, 1);
    amountOfWhiteSpaces = 0;
    spaces = [];
    for i = 1: signsAmount
        if  begEndIsIndexes(i, 3) == 0
            amountOfWhiteSpaces = amountOfWhiteSpaces + 1;
            spaces = [spaces  begEndIsIndexes(i, 4)];
        end
    end
    isSpace = [];
    for space = spaces
        diffFromMin = abs(space - min(spaces));
        diffFromMax = abs(space - max(spaces));
        if diffFromMax < diffFromMin
            isSpace = [isSpace 1];
        else
            isSpace = [isSpace 0];
        end
    end

    length = 0;
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

