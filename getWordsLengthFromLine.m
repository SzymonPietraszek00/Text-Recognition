function [ wordsLength ] = getWordsLengthFromLine( img )
    
    beginEndIndexes = getLettersBegEndIsIndexes(img);

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

    isSpace = checkIsSpaces(spaces);
    wordsLength = calculateWordsLength(isSpace,0);
end

