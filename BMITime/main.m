//
//  main.m
//  BMITime
//
//  Created by zhiye on 2024/9/26.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRStockHolding.h"
#import "BNRForeignStockHolding.h"
#import "BNRAsset.h"
#import "BNRPortfolio.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        
        // 创建BNRPerson实例
        BNREmployee *mikey = [[BNREmployee alloc] init];
        
        // 使用setter方法为实例变量赋值
//        [mikey setWeightInKilos:96];
//        [mikey setHeightInMeters:1.8];
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        
        // 使用getter方法打印出实例变量的值
//        float height = [mikey heightInMeters];
//        int weight = [mikey weightInKilos];
//        float height = mikey.heightInMeters;
//        int weight = mikey.weightInKilos;
        NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", mikey.heightInMeters, mikey.weightInKilos);

        // 使用description方法和%@转换说明让对象描述自己
        NSDate *date = mikey.hireDate;
        NSLog(@"%@ hired on %@", mikey, date);
        
        
        // 打印BMI的值
        double years = mikey.yearsOfEmployment;
        NSLog(@"mikey has a BMI of %.2f, and he has worked for %.2f years", [mikey bodyMassIndex], years);
        
        // 初始化股票
        BNRStockHolding *stock1 = [[BNRStockHolding alloc] init];
        BNRStockHolding *stock2 = [[BNRStockHolding alloc] init];
        BNRStockHolding *stock3 = [[BNRStockHolding alloc] init];
        BNRForeignStockHolding *stock4 = [[BNRForeignStockHolding alloc] init];
        
        [stock1 setPurchaseSharePrice:2.30];
        [stock1 setCurrentSharePrice:4.50];
        [stock1 setNumberOfShares:40];
        [stock1 setSymbol:@"ACB"];
        //NSLog(@"This stock's PurchaseSharePrice is %.2f, and it now values %.2f.", [stock1 costInDollars], [stock1 valueInDollars]);
       
        [stock2 setPurchaseSharePrice:12.19];
        [stock2 setCurrentSharePrice:10.56];
        [stock2 setNumberOfShares:90];
        [stock2 setSymbol:@"ABC"];
        //NSLog(@"This stock's PurchaseSharePrice is %.2f, and it now values %.2f.", [stock2 costInDollars], [stock2 valueInDollars]);
        
        [stock3 setPurchaseSharePrice:45.10];
        [stock3 setCurrentSharePrice:49.51];
        [stock3 setNumberOfShares:210];
        [stock3 setSymbol:@"LMN"];
        
        // 导入外股的数据
        stock4.purchaseSharePrice = 2.30;
        stock4.currentSharePrice = 4.50;
        stock4.numberOfShares = 40;
        stock4.conversionRate = 0.94;
        
        
        // 初始化数组并导入股票数据
        NSMutableArray *stockList = [[NSMutableArray alloc] init];
        [stock1 addSelfToArray:stockList];
        [stock2 addSelfToArray:stockList];
        [stock3 addSelfToArray:stockList];
        [stock4 addSelfToArray:stockList];
        
        //打印结果
        for (BNRStockHolding *stock in stockList) {
            if (stock) {
                NSLog(@"This stock cost %.2f in dollars, and it values %.2f in dollars.", [stock costInDollars], [stock valueInDollars]);
            }
            else NSLog(@"The data of this stock doesn't exist!");
        }
        
        // 初始化证券组合
        BNRPortfolio *port = [[BNRPortfolio alloc] init];
        [port addHoldings:stock1];
        [port addHoldings:stock2];
        [port addHoldings:stock3];
        //输出证券所有人并排序
        NSArray *sortedPort = [port sortedHolders];
        NSLog(@"soretdPort:%@", sortedPort);
        // 打印证券组合的信息
        NSLog(@"The total value of all the holdings is $%.2f, which is from %@, %@, %@", port.totalValue, stock1.symbol, stock2.symbol, stock3.symbol);
        NSLog(@"The portfolio has %@", port);
        
        // 创建一数组，用来包含多个BNREmployee对象
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // 创建NSMutableDictionary对象，用于包含多个“主管”
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        
        for (int i = 0; i < 10; i++) {
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            //给实例赋值
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 -i/10.0;
            mikey.employeeID = i;
            
            //将实例加入数组
            [employees addObject:mikey];
            
            if (i == 0) {
                [executives setObject:mikey forKey:@"CEO"];
            }
            if (i == 1) {
                [executives setObject:mikey forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // 创建10个BNRAsset对象
        for (int i = 0; i < 10; i++) {
            //创建一个BNRAsset对象
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            //为对象设置合适的标签
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.realseValue = 350 + i * 10;
            
            // 生成0至9的随机整数
            NSUInteger randomIndex = random() % [employees count];
            
            // 取出相应的BNREmployee对象
            BNREmployee *randomEmploye = [employees objectAtIndex:randomIndex];
            
            //将BNRAsset对象赋给BNREmployee对象
            [randomEmploye addAsset:asset];
            //验证弱引用的置零功能
            [allAssets addObject:asset];
        }
        
        // 堆employee数组进行排序
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors:@[voa, eid]];
        
        
        NSLog(@"Employees : %@", employees);
        NSLog(@"Giving up ownership of one empolyee");
        [employees removeObjectAtIndex:5];
        
        // 打印全部物品的信息
        NSLog(@"allAssets: %@", allAssets);
        //输出整个NSMutableArray对象
        NSLog(@"executives: %@", executives);
        
        // 输出CEO的信息
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        //过滤Filtering
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;

        NSLog(@"Giving up ownership of arrays");
 
        // 清空员工的所有物品
//        for (BNREmployee *mikey in employees) {
//            if (mikey.assets){
//                for (BNRAsset *a in mikey.assets) {
//                    [mikey removeAsset:a];
//                }
//            }
//        }
        //NSLog(@"Employees : %@", employees);
        allAssets = nil;
        employees = nil;
    }
    //sleep(60);
    return 0;
}
