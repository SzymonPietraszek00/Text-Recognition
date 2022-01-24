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

    isSpace = checkIsSpaces(spaces);
    wordsLength = calculateWordsLength(isSpace,0);
end

