#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString* openBracket = @"(<[";
    NSString* closeBracket = @")>]";
    NSMutableString * mutableString = [NSMutableString stringWithString:string];
    NSMutableArray<NSString*>* ret = [NSMutableArray arrayWithCapacity:5];
    int repeat = 0;
    for (int i = 0; i < [string length]; i++){
        for(int j = 0; j < 3; j++){
            if ([mutableString characterAtIndex:i] == [openBracket characterAtIndex:j]) {
                for (int s = i+1; s<[string length]; s++) {
                    if ([mutableString characterAtIndex:s] == [openBracket characterAtIndex:j]) {
                        repeat++;
                        continue;
                    }
                    if ([mutableString characterAtIndex:s] == [closeBracket characterAtIndex:j] && repeat!=0) {
                        repeat--;
                        continue;
                    }
                    if ([mutableString characterAtIndex:s] == [closeBracket characterAtIndex:j] && repeat==0) {
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

