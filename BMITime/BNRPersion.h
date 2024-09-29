#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

// BNRPerson有两个属性
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;
//{
//    // BNRPerson类拥有两个变量实例
//    float _heightInMeters;
//    int _weightInKilos;
//}
//// BNRPerson类拥有可以读取并设置变量的方法
//- (float)heightInMeters;
//- (void)setHeightInMeters:(float)h;
//- (int)weightInKilos;
//- (void)setWeightInKilos:(int)w;

// BNRPersopn类计算Body Mass Index的方法
- (float)bodyMassIndex;
- (void)addYourselfToArray:(NSMutableArray *)theArray;

@end
