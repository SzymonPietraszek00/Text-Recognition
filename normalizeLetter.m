function [ normalized ] = normalizeLetter( imgOfLetter )
    global regionHeight;
    global regionWidth;
    framed = zeros(regionHeight, regionWidth);
    
    colSum = sum(imgOfLetter, 1);
    rowSum = sum(imgOfLetter, 2);
    colNotZeroIndexes = find(colSum);
    rowNotZeroIndexes = find(rowSum);
    
    imgOfLetter = imgOfLetter(rowNotZeroIndexes(1): rowNotZeroIndexes(end), colNotZeroIndexes(1): colNotZeroIndexes(end));

    resized = imresize(imgOfLetter, [regionHeight - 2 regionWidth - 2]);
    framed(2:end-1, 2:end-1) = resized;
    normalized = framed(:);
end
 
