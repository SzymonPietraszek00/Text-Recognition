function [ image ] = readImage( fileName )
    image = imread(fileName);
    image = ~im2bw(image);
    image = bwlabel(image);
end

