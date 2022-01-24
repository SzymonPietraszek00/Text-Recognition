function [ letters ] = getNormalizedLettersFromLine( img )
    global regionHeight;
    global regionWidth;

    begEndIndexes = getLettersBegEndIsIndexes(img);
    amountOfLetters = sum(begEndIndexes(:, 3));
    [rows , ~] = size(begEndIndexes);
    letters = ones(regionHeight * regionWidth, amountOfLetters);
%     disp(regionHeight);
    letterIndecols = 1;
    for i = 1: rows
        if begEndIndexes(i, 3) == 1
            letterImage =  img(:, begEndIndexes(i, 1):begEndIndexes(i, 2));
            normalizedLetter = normalizeLetter(letterImage);
            letters(:, letterIndecols) = normalizedLetter;
            letterIndecols = letterIndecols + 1;
        end
    end
end

