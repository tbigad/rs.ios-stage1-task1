#import <Foundation/Foundation.h>


@interface MiniMaxArrayConverter : NSObject

- (NSArray <NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array;
- (NSArray<NSNumber*>*)sortFromMinToMax:(NSArray<NSNumber*>*)array withLenght:(int)count;
- (NSArray<NSNumber*>*)sortFromMaxToMin:(NSArray<NSNumber*>*)array withLenght:(int)count;
- (NSNumber*)sumOfElements:(NSArray<NSNumber*>*)array;
@end
