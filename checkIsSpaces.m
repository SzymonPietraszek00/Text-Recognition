function [isSpace] = checkIsSpaces(spaces)
    isSpace = [];
    for space = spaces
        diffFromMin = abs(space - min(spaces));
        diffFromMax = abs(space - max(spaces));
        if diffFromMax < diffFromMin
            isSpace = [isSpace true];
        else
            isSpace = [isSpace false];        
        end
    end

end