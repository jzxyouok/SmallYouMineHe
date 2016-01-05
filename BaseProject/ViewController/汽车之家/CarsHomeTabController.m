//
//  CarsHomeTabController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CarsHomeTabController.h"
#import "ZuiXinViewController.h"
#import "JiShuViewController.h"
#import "XinWenViewController.h"
#import "TRImageView.h"
@interface CarsHomeTabController ()

@end

@implementation CarsHomeTabController
+(CarsHomeTabController *)standardCarsInstance{
    static CarsHomeTabController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [CarsHomeTabController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消工具栏的透明状态
    //self.tabBar.translucent = NO;
    //初始化三个子视图,放到tabbar中
    ZuiXinViewController *zuixinVC = [ZuiXinViewController new];
    JiShuViewController *jishuVC = [JiShuViewController new];
    XinWenViewController *xinwenVC = [XinWenViewController new];
    UINavigationController *zuixinNavi = [[UINavigationController alloc] initWithRootViewController:zuixinVC];
    UINavigationController *jishuNavi = [[UINavigationController alloc] initWithRootViewController:jishuVC];
    UINavigationController *xinwenNavi = [[UINavigationController alloc] initWithRootViewController:xinwenVC];
    self.viewControllers = @[zuixinNavi,jishuNavi,xinwenNavi];
}

@end
