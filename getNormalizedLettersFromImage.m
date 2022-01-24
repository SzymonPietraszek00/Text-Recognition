function [ extractedLetters ] = getNormalizedLettersFromImage( img )
    beginEndIndex = getLinesBegEndIndexes(img);
    y = size(beginEndIndex, 1);
    extractedLetters = zeros(1,y);
    for i = 1: y
        beginLine = beginEndIndex(i, 1);
        endLine = beginEndIndex(i, 2);
        
        beginLine = getNormalizedLettersFromLine(img(beginLine:endLine, :));
        extractedLetters = (beginLine);
    end
%     disp(extractedLetters);
end