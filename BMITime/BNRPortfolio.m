//
//  BNRPortfolio.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#include "BNRPortfolio.h"
#include "BNRStockHolding.h"

//类拓展   
@interface BNRPortfolio () {
    NSMutableArray *_holdings;
}
@end

@implementation BNRPortfolio

// 取方法与读方法
- (void)setHoldings:(NSMutableArray *)h {
    _holdings = [h mutableCopy];
}

- (NSMutableArray *)holdings {
    return [_holdings copy];
}

// 添加一个证券机至本证券投资组合
- (void)addHoldings:(BNRStockHolding *)holding {
    // _holdings cannot be nil
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
    }
    [_holdings addObject:holding];
}

// 删除一个证券机至本证券投资组合
- (void)removeHoldings:(BNRStockHolding *)holding {
    if (_holdings) {
        [_holdings removeObject:holding];
    }
    return;
}

- (float)totalValue {
    //累加证券的总价值
    float sumOfValue = 0;
    //证券组合不为空的时候才有金额
    if (_holdings) {
        for (BNRStockHolding *holding in _holdings) {
            sumOfValue += holding.valueInDollars;
        }
    }
    return sumOfValue;
    }

// 跟踪BNRPortfolio
- (NSString *)description {
    return [NSString stringWithFormat:@"<Holding %@", self.holdings];
}

// 输出排序过后的证券所有人的数组
- (NSArray *)sortedHolders {
    NSArray *sortedHolders;
    NSMutableArray *holdersList = [[NSMutableArray alloc] init];
    for (BNRStockHolding *holders in _holdings) {
        [holdersList addObject:holders.symbol];
    }
    //简单排序
    sortedHolders = [holdersList sortedArrayUsingSelector:@selector(compare:)];
    return sortedHolders;
}
@end
