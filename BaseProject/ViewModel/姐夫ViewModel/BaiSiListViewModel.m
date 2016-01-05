//
//  NewViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiListViewModel.h"

@implementation BaiSiListViewModel

- (id)initWithNewsListType:(NewsListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}


//行数
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
//返回值
-(NewsListModel *)newslistModelForRow:(NSInteger)row{
    return self.dataArr[row];
}


/** 用户昵称 */
- (NSString *)nameForRow:(NSInteger)row{
    return [self newslistModelForRow:row].name;
}
/** 用户头像 */
- (NSURL *)profileImageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newslistModelForRow:row].profileImage];
}
/** 消息时间 */
- (NSString *)passtimeForRow:(NSInteger)row{
    return [self newslistModelForRow:row].passtime;
}
/** 点右人数 */
- (NSString *)loveForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"顶:%@",[self newslistModelForRow:row].love];
}
/** 点左人数 */
- (NSString *)hateForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"踩:%@",[self newslistModelForRow:row].hate];
}
/** 分享次数 */
- (NSString *)repostForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"分享:%@",[self newslistModelForRow:row].repost];
}
/** 评论 */
- (NSString *)commentForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"评：%@",[self newslistModelForRow:row].comment];
}

/** 分享 */
- (NSURL *)weixinURLForRow:(NSInteger )row{
    return [NSURL URLWithString:[self newslistModelForRow:row].weixinUrl];
}
/** 内容 */
- (NSString *)textForRow:(NSInteger)row{
    return [self newslistModelForRow:row].text;
}

- (NewsListModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

- (BOOL)containCdnImg:(NSInteger)row{
    return ![[self modelForArr:self.dataArr row:row].type isEqualToString:@"10"];
}

/** 图片 */
- (NSURL *)cdnImgForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newslistModelForRow:row].cdnImg];
}
-(NSURL *)image1ForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newslistModelForRow:row].image1];
}

-(NSInteger )heightImg1ForRow:(NSInteger)row{
    return [self newslistModelForRow:row].height.integerValue;
}

/** 视频地址 */
-(NSURL *)videouriForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newslistModelForRow:row].videouri];
}

//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _maxtime = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//加载更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    NewsListModel *model = self.dataArr.lastObject;
    _maxtime = model.t;
    NSLog(@"%ld",self.maxtime);
    [self getDataFromNetCompleteHandle:completionHandle];
    
}

//加载
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    self.dataTask = [BaiSiNewsNetManager getNewsListType:_type maxtime:_maxtime completionHandle:^(BaiSiNewsModel *model, NSError *error) {
        if (_maxtime == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
        completionHandle(error);
    }];
    
}




@end


