//
//  JieFuTabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JieFuTabBarController.h"
#import "JieFuViewController.h"
#import "DuanZiViewController.h"
#import "TuPianViewController.h"

@interface JieFuTabBarController ()
@end

@implementation JieFuTabBarController
+ (JieFuTabBarController *)standardInstance{
    static JieFuTabBarController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [JieFuTabBarController new];
    });
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.tabBar.translucent = NO;
    JieFuViewController *JieFuShiPin = [JieFuViewController new];
    DuanZiViewController *duanzi = [DuanZiViewController new];
    TuPianViewController *TuPian =  [TuPianViewController new];
    UINavigationController *jiefuShiPinNavi = [[UINavigationController alloc]initWithRootViewController:JieFuShiPin];
    UINavigationController *duanziNavi = [[UINavigationController alloc]initWithRootViewController:duanzi];
    UINavigationController *TuPianNavi = [[UINavigationController alloc]initWithRootViewController:TuPian];
    
    self.viewControllers = @[jiefuShiPinNavi,duanziNavi,TuPianNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
