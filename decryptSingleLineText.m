function [ string ] = decryptSingleLineText( readCode, lineImage )
    global codeLen;
    global code;

    toDecryptLetters = getNormalizedLettersFromLine(lineImage);
    wordsLength = getWordsLengthFromLine(lineImage);
    
    letters = [];
    y = size(toDecryptLetters, 2);

    for i = 1:y
        withLetter = [readCode toDecryptLetters(:,i)];
        convergenceArray = corrcoef(withLetter);
        %Avaiable: cosine, euclidean
        dist = pdist(convergenceArray, 'cosine');
        odl = squareform(dist);

        last = odl(1:codeLen, codeLen + 1);
        [value index] = min(last);
        letters = [letters code(index)];
        withLetter = withLetter(:,codeLen);
    end
    
    string = [];
    begIndex = 1;
    for wordLen = wordsLength
        string = [string letters(1, begIndex:begIndex + wordLen - 1) ' '];
        begIndex = begIndex + wordLen;
    end
end