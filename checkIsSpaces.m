function [isSpace] = checkIsSpaces(spaces)
    isSpace = [];
    for space = spaces
        diffFromMin = abs(space - min(spaces));
        diffFromMax = abs(space - max(spaces));
        if diffFromMax < diffFromMin
            isSpace = [isSpace 1];
        else
            isSpace = [isSpace 0];        end
    end

end