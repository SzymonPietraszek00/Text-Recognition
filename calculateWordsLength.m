function[wordsLength] = calculateWordsLength(isSpace, length)
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