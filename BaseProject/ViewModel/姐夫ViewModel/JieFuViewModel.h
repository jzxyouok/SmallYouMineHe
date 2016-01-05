//
//  JieFuViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface JieFuViewModel : BaseViewModel

//行数
@property(nonatomic ,assign )NSInteger rowNumber;
//pageNum
@property(nonatomic ,assign )NSInteger pageNum;



/** 题目 */
-(NSString *)titleForRow:(NSInteger)row;
/** 图片 */
-(NSURL*)picPathURLForRow:(NSInteger)row;
/** 顶 */
-(NSString *)upNumForRow:(NSInteger)row;
/** 踩 */
-(NSString *)downNumForRow:(NSInteger)row;
/** 评 */
-(NSString *)commentNumForRow:(NSInteger)row;
/** 享 */
-(NSString *)shareNumForRow:(NSInteger)row;

/** 播放次数 */
-(NSString *)clickNumForRow:(NSInteger)row;
/** 行高 可能没用 */
-(NSInteger)heightForRow:(NSInteger)row;
/** 视频路径 */
-(NSURL *)gifPathForRow:(NSInteger)row;



@end
