//
//  BNRPortfolio.h
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSMutableArray 
//补充一对多关系
@property (nonatomic, copy) NSMutableArray *holdings;

- (void)addHoldings:(BNRStockHolding *)h;
- (void)removeHoldings:(BNRStockHolding *)h;
- (float)totalValue;
- (NSArray *)sortedHolders;

@end
