clc;
clf;
clear all;

function morseDict = createMorseDictionary()
    morseDict = containers.Map( ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ...
         '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}, ...
        {'.-', '-...', '-.-.', '-..', '.', '..-.', '--.', '....', '..', '.---', '-.-', '.-..', '--', '-.', '---', '.--.', '--.-', '.-.', '...', '-', '..-', '...-', '.--', '-..-', '-.--', '--..', ...
         '-----', '.----', '..---', '...--', '....-', '.....', '-....', '--...', '---..', '----.'} ...
    );
end

function morseCode= morseEncode(text)
     morseDict= createMorseDictionary();
     text= upper(text);
     morseCode=' ';
     for i=1:length(text)
         char= text(i);
         if char==' '
             morseCode=[morseCode,' / '];
         elseif isKey(morseDict,char)
             morseCode=[morseCode,morseDict(char),' '];
         end
     end
end
function text = morseDecode(morseCode)
    morseDict = createMorseDictionary();
    reverseDict = containers.Map(values(morseDict), keys(morseDict));
    text = '';
    morseWords = strsplit(morseCode, '/');
    for i = 1:length(morseWords)
        morseChars = strsplit(morseWords{i}, ' ');
        for j = 1:length(morseChars)
            morseChar = morseChars{j};
            if isKey(reverseDict, morseChar)
                text = [text, reverseDict(morseChar)];
            end
        end
        text = [text, ' '];  
    end
    text = strtrim(text);  
end


choice=input('Enter 1 for encoding the text to morse code. Enter 2 for decoding your morse code to text: ','s');
if strcmpi(choice,'1') 
    morsetext=input('Enter text to encode: ','s');
    encoded=morseEncode(morsetext);
    disp(['Original Text: ', morsetext]);
    disp(['Encoded Morse code: ',encoded]);

elseif strcmpi(choice,'2') 
    mtext=input('Enter Morse Code to decode: ','s');
    decoded=morseDecode(mtext);
    disp(['Original Morse code: ',mtext ]);
    disp(['deoded text: ',decoded]);

else 
    disp('Enter a proper choice');
end



