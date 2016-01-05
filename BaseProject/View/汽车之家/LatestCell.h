//
//  LatestCell.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface LatestCell : UITableViewCell
@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *dateLb;
@property(nonatomic,strong)UILabel *commentLb;
@end
