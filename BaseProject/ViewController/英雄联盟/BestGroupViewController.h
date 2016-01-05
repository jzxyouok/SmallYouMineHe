//
//  BestGroupViewController.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//
/**
 
 1.创建BestGroupViewModel
 值需要实现getData就可以,没有分页问题
 model只提供了英雄英文名,需要拼入英雄头像链接才可以
 2.创建BestGroupCell,继承UITableViewCell
 头像的大小固定,间距使用 (window宽 - 5*图片宽) /6获得
 3.BestGroupViewController制作
 对于cell高度:只需要实现estimatedHeightForRow协议即可自动适应
 4.在BaiKeViewController的cell点击事件中判断,vm层的tag值是best_group,则跳转
 */



#import <UIKit/UIKit.h>

@interface BestGroupViewController : UIViewController

@end
