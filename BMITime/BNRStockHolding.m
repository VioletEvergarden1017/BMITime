//
//  ZYStocjHolding.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

# import "BNRStockHolding.h"

@implementation BNRStockHolding

// 取方法实现
- (float)purchaseSharePrice {
    return _purchaseSharePrice;
}

- (float)currentSharePrice {
    return _currentSharePrice;
}

- (int)numberOfShares {
    return _numberOfShares;
}

// 存方法实现
- (void)setPurchaseSharePrice:(float)purPrice {
    _purchaseSharePrice = purPrice;
}

- (void)setCurrentSharePrice:(float)curPrice {
    _currentSharePrice = curPrice;
}

- (void)setNumberOfShares:(int)n {
    _numberOfShares = n;
}

//计算买入价格与现在价值
- (float)costInDollars {
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars {
    return [self currentSharePrice] * [self numberOfShares];
}

//加入自己至数组
- (void)addSelfToArray:(NSMutableArray *)array {
    [array addObject:self];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<symbol:%@ purcharsePrice:%.2f currentPrice:%.2f numberOfShares:%u>",
            self.symbol, self.purchaseSharePrice, self.currentSharePrice, self.numberOfShares];
}
@end
