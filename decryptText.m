function [ text ] = decryptText( codeNormalized, textImage)
    begEndLinesYIndexes = getLinesBegEndIndexes(textImage);
    [y, x] = size(begEndLinesYIndexes);
    text = '';
    for i = 1: y
        lineStartYIndex = begEndLinesYIndexes(i, 1);
        lineEndYIndex = begEndLinesYIndexes(i, 2);
        line = decryptSingleLineText(codeNormalized, textImage(lineStartYIndex:lineEndYIndex, :));
        text = strcat(text, ' -> ' , line);
    end
    text
end

