#import "BNRPersion.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;

@property (nonatomic) NSDate *hireDate;
@property (nonatomic) NSString *lastName;
//@property (nonatomic) BNRPerson *spouse;
//@property (nonatomic) NSMutableArray *children;

// 补充对asset的一对多关系
@property (nonatomic, copy) NSSet *assets;


- (double)yearsOfEmployment;
- (void)addAsset:(BNRAsset *)a;
- (void)removeAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end

