#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int count = (int)array.count - 1ul;
    NSMutableArray<NSNumber*>* ret = [NSMutableArray new];
    NSArray<NSNumber *> *min = [self sortFromMinToMax:array withLenght:count];//Сортируем по условию
    NSArray<NSNumber *> *max = [self sortFromMaxToMin:array withLenght:count];//Сортируем по условию
    [ret addObject:[self sumOfElements:min]];//Суммируем по условию
    [ret addObject:[self sumOfElements:max]];//Суммируем по условию
    return [ret copy];
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
