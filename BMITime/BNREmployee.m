//
//  BNREmployee.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

// 类拓展,以interface开始，end结束。非Employee对象无法看到officeAlarmCode这个属性
@interface BNREmployee () {
    NSMutableSet * _assets;
}
@property (nonatomic) unsigned int officeAlarmCode;
@end

@implementation BNREmployee

- (double)yearsOfEmployment {
    //hireDate需要为非nil
    if(self.hireDate) {
        //NSTimeInterval是double类型
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 32557600.0;
    } else {
        return 0;
    }
}

// 覆盖继承自BNRPerson的BMI方法
//- (float)bodyMassIndex {
//    return 19.0;
//}

// 覆盖父类的方法，采用super
- (float)bodyMassIndex {
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

// 跟踪BNREmployee实例的释放情况，覆盖description方法与dealloc方法
- (NSString *)description {
//    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
    return [NSString stringWithFormat:@"<Employee %u: $%u asssets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

// 属性的存取方法
- (void)setAssets:(NSArray *)a {
    _assets = [a mutableCopy];
}

- (NSArray *)assets {
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a {
    // asset需要为非nil
    if (!_assets) {
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    a.holder = self; //给employee添加物品的时候，同时设置该物品的holder为该员工
}

- (void)removeAsset:(BNRAsset *)a {
    if (_assets) {
        [_assets removeObject:a];
        return;
    }
    return;
}

- (unsigned int)valueOfAssets {
    // 累加物品的转售价值
    unsigned int sumValue = 0;
    for (BNRAsset *a in _assets) {
        sumValue += a.realseValue;
    }
    return  sumValue;
}
@end
