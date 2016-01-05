//
//  BaiSiCell.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface BaiSiCell : UITableViewCell
//** 头像 */
@property(nonatomic,strong)TRImageView *iconIV;
//** 名字 */
@property(nonatomic,strong)UILabel *nameLb;
//** 时间 */
@property(nonatomic,strong)UILabel *passTimeLb;
/** 点右人数 */
@property(nonatomic ,strong )UILabel *loveLb;
/** 点左人数 */
@property(nonatomic ,strong )UILabel *hateLb;
/** 分享 */
@property(nonatomic ,strong )UILabel *repostLb;
/** 评论 */
@property(nonatomic ,strong )UILabel *commentLb;

@end
