#import "BillCounter.h"

@interface BillCounter()
- (NSArray<NSNumber*>*)orderForBill:(NSArray<NSNumber*>*)array;
- (NSArray<NSNumber*>*)orderForAnna:(NSArray<NSNumber*>*)array notIncludingElementWithIndex:(NSInteger)index;
- (NSNumber *)sumOfElements:(NSArray<NSNumber *> *)array;
@end

@implementation BillCounter

- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSArray<NSNumber *> * annaOrder = [self orderForAnna:bill notIncludingElementWithIndex:index];
    NSNumber *annaSum = [self sumOfElements:annaOrder];//Считаем анну
    
    if([sum intValue] == [annaSum intValue]){ //возвращаем согласно условию
        return @"Bon Appetit";
    } else {
        int diff = [sum intValue] - [annaSum intValue];
        return [@(diff) stringValue];
    }
}

- (NSNumber *)sumOfElements:(NSArray<NSNumber *> *)array{
    float sum = 0;
    for (NSNumber *num in array) {
      sum += [num floatValue];
    }
    return [[NSNumber alloc]initWithFloat:sum];
}

- (NSArray<NSNumber *> *)orderForBill:(NSArray<NSNumber *> *)array {
    NSMutableArray<NSNumber *> *ret = [[NSMutableArray<NSNumber *> alloc] init];
    for (NSNumber* item in array) {
        NSNumber* billPrice = [[NSNumber alloc] initWithFloat:[item floatValue] / 2];
        [ret addObject:billPrice];
    }
    return ret;
}

- (NSArray<NSNumber *> *)orderForAnna:(NSArray<NSNumber *> *)array notIncludingElementWithIndex:(NSInteger)index {
    NSMutableArray<NSNumber *> *ret = [[NSMutableArray<NSNumber *> alloc] init];
    for (int i = 0; i < array.count; i++) {
        if (i == index) {
            continue;
        }
        NSNumber* annaPrice = [[NSNumber alloc] initWithFloat:[array[i] floatValue] / 2];
        [ret addObject:annaPrice];
    }
    return ret;
}

@end
