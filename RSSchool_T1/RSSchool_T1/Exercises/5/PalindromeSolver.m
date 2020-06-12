#import "PalindromeSolver.h"

@interface PalindromeSolver()
- (BOOL) isPolyndrome:(NSString*)string;
@end

@implementation PalindromeSolver

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    int lo = 0;
    int hi = [n intValue] - 1;
    int nVal = [n intValue];
    int kVal = [k intValue];
    char *string = malloc(sizeof(char*) * s.length);
    strcpy(string, [s cStringUsingEncoding:NSUTF8StringEncoding]);
    
    int diff = 0;

    for(int i = 0, j = nVal-1; i < nVal/2; i++, j--){
        if (string[i] != string[j]){
            diff++;
        }
    }

    if (diff > kVal){
        return @"-1";
    }

    while(hi >= lo){
        if (kVal <= 0){
            break;
        }

        if (string[lo] == string[hi]){
            if (kVal > 1 && (kVal-2) >= diff && string[lo] != '9'){
                string[lo] = '9';
                string[hi] = '9';
                kVal-=2;
            }
        }
        else {
            if (kVal > 1 && (kVal - 2) >= diff - 1){
                if (string[lo] != '9'){
                    string[lo] = '9';
                    kVal--;
                }
                if (string[hi] != '9'){
                    string[hi] = '9';
                    kVal--;
                }
            } else {
                if (string[lo] > string[hi]){
                    string[hi] = string[lo];
                } else {
                    string[lo] = string[hi];
                }
                kVal--;
            }
            diff--;
        }
        if (lo == hi && kVal > 0){
            string[lo] = '9';
            kVal--;
        }
        lo++;
        hi--;
    }

    NSString *result = [NSString stringWithCString:string encoding:NSUTF8StringEncoding];
    return [self isPolyndrome:result] ? result : @"-1";
}

- (BOOL)isPolyndrome:(NSString *)string {
    int i = 0;
    int j = (int)string.length - 1;

    while(j > i){
        if ([string characterAtIndex:i] == [string characterAtIndex:j]){
            i++; j--;
        } else {
            return false;
        }
    }
    return true;
}

@end
