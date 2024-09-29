//
//  ZYStocjHolding.h
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject {
    float _purchaseSharePrice;
    float _currentSharePrice;
    int _numberOfShares;
}

@property (nonatomic) NSString *symbol;

// 取方法
- (float)purchaseSharePrice;
- (float)currentSharePrice;
- (int)numberOfShares;

// 存方法
- (void)setPurchaseSharePrice:(float)purPrice;
- (void)setCurrentSharePrice:(float)curPrice;
- (void)setNumberOfShares:(int)n;

// 计算花费与成本
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOfShares

- (void)addSelfToArray:(NSMutableArray *)array;
@end
