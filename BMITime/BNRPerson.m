//
//  main.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import "BNRPersion.h"

@implementation BNRPerson

//- (float)heightInMeters {
//    return _heightInMeters;
//}
//
//- (void)setHeightInMeters:(float)h {
//    _heightInMeters = h;
//}
//
//- (int)weightInKilos {
//    return  _weightInKilos;
//}
//
//- (void)setWeightInKilos:(int)w {
//    _weightInKilos = w;
//}

- (float)bodyMassIndex {
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

- (void)addYourselfToArray:(NSMutableArray *)theArray {
    [theArray addObject:self];
}
@end
