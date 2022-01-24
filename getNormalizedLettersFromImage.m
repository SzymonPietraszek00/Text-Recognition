% From BW image creates matrix with normalized letters from image (one letter in each column)
function [ extractedLetters ] = getNormalizedLettersFromImage( img )
    begEndLinesYIndexes = getLinesBegEndIndexes(img);
    y = size(begEndLinesYIndexes, 1);
    extractedLetters = [];
    for i = 1: y
        lineStartYIndex = begEndLinesYIndexes(i, 1);
        lineEndYIndex = begEndLinesYIndexes(i, 2);
        
        normalizedLettersFromLine = getNormalizedLettersFromLine(img(lineStartYIndex:lineEndYIndex, :));
        extractedLetters = [extractedLetters normalizedLettersFromLine];
    end
end