function [ textLine ] = decryptSingleLineText( readCode, lineImage )
    global codeLen;
    global code;

    toDecryptLetters = getNormalizedLettersFromLine(lineImage);
    wordsLength = getWordsLengthFromLine(lineImage);
    y = size(toDecryptLetters, 2);
    letters = [];

    for i = 1:y
        withLetter = [readCode toDecryptLetters(:,i)];
        convergenceArray = corrcoef(withLetter); % Correlation coefficients
        dist = pdist(convergenceArray');
        odl = squareform(dist);

        last = odl(1:codeLen, codeLen + 1);
        [~, index] = min(last);
        letters = [letters code(index)];
        withLetter = withLetter(:,codeLen);
    end
    
    textLine = [];
    it = 1;
    for wordLen = wordsLength
        % reading lines word by word
        textLine = [textLine letters(1, it:it + wordLen - 1) ' '];
        it = it + wordLen;
%         disp(textLine);
    end
end