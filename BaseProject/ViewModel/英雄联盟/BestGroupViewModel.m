//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//
/* 制作步骤
 多玩饭盒-首页-百科-最佳阵容查看效果
 1.创建BestGroupViewModel
 值需要实现getData就可以,没有分页问题
 model只提供了英雄英文名,需要拼入英雄头像链接才可以
 2.创建BestGroupCell,继承UITableViewCell
 头像的大小固定,间距使用 (window宽 - 5*图片宽) /6获得
 3.BestGroupViewController制作
 对于cell高度:只需要实现estimatedHeightForRow协议即可自动适应
 4.在BaiKeViewController的cell点击事件中判断,vm层的tag值是best_group,则跳转
 */


#import "BestGroupViewModel.h"

@implementation BestGroupViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(BestGroupModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}

/** 某行标题 */
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/** 某行第一个头像 */
-(NSURL *)oneheroForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero5];
    return [NSURL URLWithString:path];
}
/** 某行第二个头像 */
-(NSURL *)twoheroForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero3];
    return [NSURL URLWithString:path];
}
/** 某行第三个头像 */
-(NSURL *)threeheroForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero1];
    return [NSURL URLWithString:path];
}
/** 某行第四个头像 */
-(NSURL *)fourheroForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero4];
    return [NSURL URLWithString:path];
}
/** 某行第五个头像 */
-(NSURL *)fiveheroForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].hero2];
    return [NSURL URLWithString:path];
}

/** 某行内容描述 */
-(NSString *)desForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}


/** 英雄头像URL数组 */
- (NSArray *)iconURLsForRow:(NSInteger)row{
    return @[kIconPathWithEnName([self modelForRow:row].hero1),
             kIconPathWithEnName([self modelForRow:row].hero2),
             kIconPathWithEnName([self modelForRow:row].hero3),
             kIconPathWithEnName([self modelForRow:row].hero4),
             kIconPathWithEnName([self modelForRow:row].hero5)];
}

/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row{
    return @[[self modelForRow:row].des1,
             [self modelForRow:row].des2,
             [self modelForRow:row].des3,
             [self modelForRow:row].des4,
             [self modelForRow:row].des5];
}
@end
