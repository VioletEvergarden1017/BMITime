//
//  BNRAsset.h
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString * label;
@property (nonatomic) unsigned int realseValue;
@property (nonatomic, weak) BNREmployee *holder;// 解决强引用循环导致的内存泄漏问题

@end
