function [ lettersMatrix ] = getNormalizedLetters( image, rows, cols )
%     clc
    selectedRegion = regionprops(image, 'all');
    letterIndex = 0;
    [x] = length(selectedRegion);
    lettersMatrix = ones(rows * cols, x);
%     disp(lettersMatrix);
%     fprintf("DEBUG");
    for i = 1: x
        b = selectedRegion(i).Image;
        [imY, ~] = size(b);
        if imY ~= 0
            resized = imresize(b, [rows cols]);
            resized = resized(:);
            letterIndex = letterIndex + 1;
            lettersMatrix(:,letterIndex) = resized;
        end
    end
    lettersMatrix = lettersMatrix(:, 1:letterIndex);
end

    