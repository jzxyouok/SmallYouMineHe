//
//  LatestViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestViewModel.h"

@implementation LatestViewModel
-(id)initWithNewsListType:(NewsListType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}


- (NSInteger)rowNumber{
    return self.dataArr.count;
}
//- (NSMutableArray *)dataArr{
//    if (!_dataArr) {
//        _dataArr=[NSMutableArray new];
//    }
//    return _dataArr;
//}

- (NewsResultNewslistModel *)newsListModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newsListModelForRow:row].smallpic];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self newsListModelForRow:row].title;
}
- (NSString *)dateForRow:(NSInteger)row{
    return [self newsListModelForRow:row].time;
}
- (NSString *)commentNumberForRow:(NSInteger)row{
    return [[self newsListModelForRow:row].replycount.stringValue stringByAppendingString:@"评论"];
}
- (NSNumber *)IDForRow:(NSInteger)row{
    return [self newsListModelForRow:row].ID;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [NewsNetManager getNewsListType:_type lastTime:_updateTime page:_page completionHandle:^(NewsModel *model, NSError *error) {
        if ([_updateTime isEqualToString:@"0"]) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.result.anewslist];
        
        NSMutableArray *imgArr =[NSMutableArray new];
        for (NewsResultFocusimgModel *obj in model.result.focusimg) {
            NSURL *imageURL=[NSURL URLWithString:obj.imgurl];
            [imgArr addObject:imageURL];
        }
        self.headImageURLs = [imgArr copy];
        completionHandle(error);
    }];

}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _updateTime = @"0";
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    NewsResultNewslistModel *obj=self.dataArr.lastObject;
    _updateTime = obj.lasttime;
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end