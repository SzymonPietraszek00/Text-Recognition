%% used to extract normalized letters from single line image
%% image should be cutted up an down
function [ letters ] = getNormalizedLettersFromLine( SL_Image )
    global regionHeight;
    global regionWidth;

    begEndIsIndexes = getLettersBegEndIsIndexes(SL_Image);
    [y x] = size(begEndIsIndexes);
    amountOfLetters = sum(begEndIsIndexes(:, 3));
    letters = ones(regionHeight * regionWidth, amountOfLetters);
    letterIndex = 1;
    for i = 1: y
        if begEndIsIndexes(i, 3) == 1
            letterImage =  SL_Image(:, begEndIsIndexes(i, 1):begEndIsIndexes(i, 2));
            normalizedLetter = normalizeLetter(letterImage);
            letters(:, letterIndex) = normalizedLetter;
            letterIndex = letterIndex + 1;
        end
    end
end

