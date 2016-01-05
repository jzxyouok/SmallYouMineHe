//
//  NewViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "BaiSiNewsNetManager.h"

@interface BaiSiListViewModel : BaseViewModel
-(id)initWithNewsListType:(NewsListType)type;
@property(nonatomic)NewsListType type;

@property(nonatomic ,assign )NSInteger rowNumber;

/** 用户昵称 */
- (NSString *)nameForRow:(NSInteger)row;
/** 用户头像 */
- (NSURL *)profileImageURLForRow:(NSInteger)row;
/** 消息时间 */
- (NSString *)passtimeForRow:(NSInteger)row;
/** 点右人数 */
- (NSString *)loveForRow:(NSInteger)row;
/** 点左人数 */
- (NSString *)hateForRow:(NSInteger)row;
/** 分享次数 */
- (NSString *)repostForRow:(NSInteger)row;
/** 评论次数 */
- (NSString *)commentForRow:(NSInteger)row;
/** 分享 */
- (NSURL *)weixinURLForRow:(NSInteger )row;
/** 内容 */
- (NSString *)textForRow:(NSInteger)row;

/** 加载时间 */
@property(nonatomic ,assign )NSInteger maxtime;

/** 图片 */
-(NSURL *)cdnImgForRow:(NSInteger)row;
-(NSURL *)image1ForRow:(NSInteger)row;
-(NSInteger )heightImg1ForRow:(NSInteger)row;

/** 视频地址 */
-(NSURL *)videouriForRow:(NSInteger)row;

@end
