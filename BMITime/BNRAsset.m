//
//  BNRAsset.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *) description {
    //return  [NSString stringWithFormat:@"<%@ $%u>", self.label, self.realseValue];
    // holder是否为nil
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>", self.label, self.realseValue, self.holder];
    }else {
        return [NSString stringWithFormat:@"<%@: %d unassigned>", self.label, self.realseValue];
    }
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

@end
