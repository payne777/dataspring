//
//  ViewController.m
//  dataspring
//
//  Created by 王鹏 on 2022/7/28.
//


#import "ViewController.h"
 
@interface ViewController ()
 
@end

 
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData:^(id data) {
        //更新UI
    }];
}

- (BOOL)login:(NSString *)userName password:(NSString *)passWord{
    if ([userName isEqualToString:@"userName"] &&
        [passWord isEqualToString:@"passWord"]) {
        return YES;
    }
    return NO;
}


- (void)loadManyDatas{
    for (int i = 0; i<200; i++) {
        NSLog(@"测试下");
    }
}

- (void)requestData:(void(^)(id data))dataBlock{
    
    //模拟数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *str = @"我是王鹏";
        [NSThread sleepForTimeInterval:3];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            dataBlock(str);
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
@end
