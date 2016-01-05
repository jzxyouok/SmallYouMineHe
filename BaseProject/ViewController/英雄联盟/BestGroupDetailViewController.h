//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//
/*
    1.数据的传入:通过在BestGroupViewController中点击任意cell,获取到对应的BestGroupModel类型的对象
    2.整体是一个tableView,是group风格,两个section
    3.有两种类型的cell,一种负责显示团队的简介,--不可选
    4.另一种,负责每个角色的简介
    5.cell选中以后是浅黄色,色值自己量取
*/
#import <UIKit/UIKit.h>

@interface BestGroupDetailViewController : UIViewController

- (id)initWithTitle:(NSString *)title desc:(NSString *)desc icons:(NSArray *)icons decs:(NSArray *)descs;
@property(nonatomic,strong) NSString *title0; //区别系统关键词
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSArray *icons;
@property(nonatomic,strong) NSArray *descs;


@end
