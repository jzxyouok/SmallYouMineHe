//
//  JieFuVideoCell.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "TRImageView.h"

@interface JieFuVideoCell : UITableViewCell

/** 题目 */
@property(nonatomic,strong)UILabel *textLb;

/** 顶 */
@property(nonatomic ,strong )UILabel *upNumLb;
/** 踩 */
@property(nonatomic ,strong )UILabel *downNumLb;
/** 评论 */
@property(nonatomic ,strong )UILabel *commentNumLb;
/** 分享 */
@property(nonatomic ,strong )UILabel *shareNumLb;
/** 播放次数 */
@property(nonatomic ,strong )UILabel *clickNumLb;

/** 播放按钮*/
@property (nonatomic,strong)UIButton *playBtn;
/** 播放地址*/
@property (nonatomic,strong)NSURL *gifPath;

/** 视频*/
@property (nonatomic,strong)UIImageView *videoIV;

/** 显示时长和播放次数*/
@property (nonatomic,strong)UIView *playView;


@end
