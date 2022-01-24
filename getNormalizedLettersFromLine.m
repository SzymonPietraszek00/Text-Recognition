% used to extract normalized letters from single line image
% image should be cutted up an down
function [ letters ] = getNormalizedLettersFromLine( img )
    global regionHeight;
    global regionWidth;

    begEndIsIndexes = getLettersBegEndIsIndexes(img);
    [rows cols] = size(begEndIsIndexes);
    amountOfLetters = sum(begEndIsIndexes(:, 3));
    letters = ones(regionHeight * regionWidth, amountOfLetters);
    disp(regionHeight);
    letterIndecols = 1;
    for i = 1: rows
        if begEndIsIndexes(i, 3) == 1
            letterImage =  img(:, begEndIsIndexes(i, 1):begEndIsIndexes(i, 2));
            normalizedLetter = normalizeLetter(letterImage);
            letters(:, letterIndecols) = normalizedLetter;
            letterIndecols = letterIndecols + 1;
        end
    end
end

