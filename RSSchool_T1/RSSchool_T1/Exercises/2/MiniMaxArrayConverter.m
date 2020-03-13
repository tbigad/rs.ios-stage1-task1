#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSArray<NSNumber *> *min = [self sortFromMinToMax:array withLenght:array.count - 1];
    NSArray<NSNumber *> *max = [self sortFromMaxToMin:array withLenght:array.count - 1];
    NSNumber* minValue = [self sumOfElements:min];
    NSNumber* maxValue = [self sumOfElements:max];
    
    NSArray<NSNumber*>* ret = [[NSArray alloc]initWithObjects:minValue,maxValue, nil];
    return ret;
}

- (NSArray<NSNumber *> *)sortFromMaxToMin:(NSArray<NSNumber *> *)array withLenght:(int)count {
    NSSortDescriptor *aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    return [[array sortedArrayUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]] subarrayWithRange:NSMakeRange(0, count)];
}

- (NSArray<NSNumber *> *)sortFromMinToMax:(NSArray<NSNumber *> *)array withLenght:(int)count {
    NSSortDescriptor *aSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    
    return [[array sortedArrayUsingDescriptors:[NSArray arrayWithObject:aSortDescriptor]] subarrayWithRange:NSMakeRange(0, count)];
}

- (NSNumber *)sumOfElements:(NSArray<NSNumber *> *)array {
    NSInteger sum = 0;
    for (NSNumber *num in array) {
      sum += [num intValue];
    }
    return [[NSNumber alloc]initWithLong:sum];
}
@end
