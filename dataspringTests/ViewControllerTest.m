//
//  ViewControllerTest.m
//  dataspringTests
//
//  Created by 王鹏 on 2022/7/28.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase
@property (nonatomic, strong)ViewController *controller;
@end

@implementation ViewControllerTest

- (void)setUp {
    self.controller = [[ViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.controller = nil;
}

#pragma mark - 逻辑测试
- (void)testExample {
    //given ====> 数据
    NSString *userName =@"userName";
    NSString *passWord =@"passWord";

    //when ==> ceshi
    BOOL result = [self.controller login:userName password:passWord];
    //then ===> 判断
    XCTAssertEqual(result, YES,@"登录成功");
}

#pragma mark - 性能测试
- (void)testPerformanceExample2{
    [self measureMetrics:@[XCTPerformanceMetric_WallClockTime] automaticallyStartMeasuring:NO forBlock:^{
        [self startMeasuring];
        //只测试抱在这两个方法里面的性能
        [self.controller loadManyDatas];
        [self stopMeasuring];
    }];
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        [self.controller loadManyDatas];
    }];
}

#pragma mark - 异步测试
- (void)testAcy{
    //given ==> 预期
    XCTestExpectation *exp = [self expectationWithDescription:@"this acy test my exp"];
    //when
    [self.controller requestData:^(id data) {
        XCTAssertNotNil(data);//逻辑测试  15
        [exp fulfill];//预期抛出点
    }];
    //then
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

@end
