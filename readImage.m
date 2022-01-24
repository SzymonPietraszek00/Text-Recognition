function [ image ] = readImage( file )
    image = imread(file);
    image = ~im2bw(image);
    image = bwlabel(image);
end

