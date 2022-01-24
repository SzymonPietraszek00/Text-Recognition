function [ letters ] = getNormalizedLetters( image, rows, columns )
%     imshow(image);
    selectedRegion = regionprops(image, 'all');
    
    [x] = length(selectedRegion);
    letterIndex = 0;
    letters = ones(rows * columns, x);
    for i = 1: x
        b = selectedRegion(i).Image;
        [imY, ~] = size(b);
        if imY ~= 0
            resized = imresize(b, [rows columns]);
            resized = resized(:);
            letterIndex = letterIndex + 1;
            letters(:,letterIndex) = resized;
        end
    end
    letters = letters(:, 1:letterIndex);
end

