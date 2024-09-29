//
//  BNRStockForeignHolding.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

- (float)purchaseSharePrice {
    float localPrice = [super purchaseSharePrice];
    return localPrice * self.conversionRate;
}

- (float)valueInDollars {
    float localValue = [super valueInDollars];
    return localValue * self.conversionRate;
}
@end
