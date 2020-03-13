#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray.count == 0) {
        return @[];
    }
    
    long minIndex = 0;
    bool isComplite = false;
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    [ret addObjectsFromArray:sadArray];
    
    while (!isComplite) {
        isComplite = true;
        for (int i = 1; i < ret.count - 1; i++) {
            if ( [ret[i] isEqual:ret.firstObject] || [ret[i] isEqual:ret.lastObject] ) {
                continue;
            }
            int sum = [ret[i - 1] intValue] + [ret[i + 1] intValue];
            if (sum < [ret[i] intValue]) {
                if([ret containsObject:ret[i]]){
                    [ret removeObjectAtIndex:i];
                    isComplite = false;
                    break;
                }
            }
        }
    }
    
    return ret;
}

@end
