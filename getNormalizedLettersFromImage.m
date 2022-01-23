%% From BW image creates matrix with normalized letters from image (one letter in each column)
function [ letters ] = getNormalizedLettersFromImage( textImage )
    begEndLinesYIndexes = getLinesBegEndIndexes(textImage);
    y = size(begEndLinesYIndexes, 1);
    letters = [];
    for i = 1: y
        lineStartYIndex = begEndLinesYIndexes(i, 1);
        lineEndYIndex = begEndLinesYIndexes(i, 2);
        
        normalizedLettersFromLine = getNormalizedLettersFromLine(textImage(lineStartYIndex:lineEndYIndex, :));
        letters = [letters normalizedLettersFromLine];
    end
end