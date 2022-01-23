% creates the letter with 1 px black frame around it and size specified
% globally by regionHeight and regionWidth
function [ normalized ] = normalizeLetter( letterImage )
    global regionHeight;
    global regionWidth;
    framed = zeros(regionHeight, regionWidth);
  
    %cut region with letter
    colSum = sum(letterImage, 1);
    rowSum = sum(letterImage, 2);
    colNotZeroIndexes = find(colSum);
    rowNotZeroIndexes = find(rowSum);
    
    letterImage = letterImage(rowNotZeroIndexes(1): rowNotZeroIndexes(end), colNotZeroIndexes(1): colNotZeroIndexes(end));
    
    %Normalize size
    resized = imresize(letterImage, [regionHeight - 2 regionWidth - 2]);
    framed(2:end-1, 2:end-1) = resized;
    normalized = framed(:);
end

