#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString* openBracketSymbols = @"(<[";
    NSString* closeBracketSymbols = @")>]";
    NSMutableString * mutableString = [NSMutableString stringWithString:string];
    NSMutableArray<NSString*>* ret = [NSMutableArray arrayWithCapacity:5];
    int counter = 0;
    for (int i = 0; i < [string length]; i++){
        for(int j = 0; j < 3; j++){
            if ([mutableString characterAtIndex:i] == [openBracketSymbols characterAtIndex:j]) {
                for (int s = i+1; s<[string length]; s++) {
                    if ([mutableString characterAtIndex:s] == [openBracketSymbols characterAtIndex:j]) {
                        counter++;
                        continue;
                    }
                    if ([mutableString characterAtIndex:s] == [closeBracketSymbols characterAtIndex:j] && counter != 0) {
                        counter--;
                        continue;
                    }
                    if ([mutableString characterAtIndex:s] == [closeBracketSymbols characterAtIndex:j] && counter == 0) {
                        [ret addObject:[string substringWithRange:NSMakeRange(i+1, s-i-1)]];
                        break;
                    }
                }
            }
        }
    }
    return ret;
}

@end

