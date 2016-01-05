//
//  ZBCategoryDetailViewController.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBCategoryDetailViewController : UIViewController
- (id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong) NSString *tag;
@end
