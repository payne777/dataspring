//
//  ViewController.h
//  dataspring
//
//  Created by 王鹏 on 2022/7/28.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (BOOL)login:(NSString *)account password:(NSString *)password;

- (void)loadManyDatas;

- (void)requestData:(void(^)(id data))dataBlock;

@end

