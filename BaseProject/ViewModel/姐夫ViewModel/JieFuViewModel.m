//
//  JieFuViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JieFuViewModel.h"
#import "JieFuNetManager.h"
@implementation JieFuViewModel
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageNum = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageNum += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [JieFuNetManager getJieFuWithpageNum:_pageNum completionHandle:^(JieFuModel *model, NSError *error) {
        if (_pageNum == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
    
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
//fanhui zhi
-(JieFuDataModel *)jiefudataModelRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 题目 */
-(NSString *)titleForRow:(NSInteger)row{
    return [self jiefudataModelRow:row].title;
}
/** 图片 */
-(NSURL*)picPathURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self jiefudataModelRow:row].mainPicPath];
}
/** 顶 */
-(NSString *)upNumForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"顶:%ld",[self jiefudataModelRow:row].upNum];
}
/** 踩 */
-(NSString *)downNumForRow:(NSInteger)row{
return [NSString stringWithFormat:@"踩:%ld",[self jiefudataModelRow:row].downNum];
}
/** 评 */
-(NSString *)commentNumForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"评论:%ld",[self jiefudataModelRow:row].commentNum];
}
/** 享 */
-(NSString *)shareNumForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"分享:%ld",[self jiefudataModelRow:row].shareNum];
}

/** 播放次数 */
-(NSString *)clickNumForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld次播放",[self jiefudataModelRow:row].clickNum];
}

-(NSInteger)heightForRow:(NSInteger)row{
    return [self jiefudataModelRow:row].itemView.height;
}

/** 视频路径 */
- (NSURL *)gifPathForRow:(NSInteger)row{
    return [NSURL URLWithString:[self jiefudataModelRow:row].itemView.gifPath];
}












@end
