//
//  ZBDetailViewController.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBItemModel.h"
@interface ZBDetailViewController : UIViewController
//* 写一个方法,这个方法用来接收上一个界面传过来的ID */
-(id)initWithitemID:(ZBItemModel *)itemModel;
@property(nonatomic,strong)ZBItemModel *itemModel;
@end
