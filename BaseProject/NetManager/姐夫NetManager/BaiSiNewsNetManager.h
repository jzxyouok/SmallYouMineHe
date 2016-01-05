//
//  DuanZiNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "BaiSiNewsModel.h"

typedef NS_ENUM(NSUInteger,NewsListType) {
    NewsListTypeShiPin,
    NewsListTypeTuPian,
    NewsListTypeDuanZi,
    NewsListTypeShengYin,
};




@interface BaiSiNewsNetManager : BaseNetManager
+ (id)getNewsListType:(NewsListType)type maxtime:(NSInteger)maxtime kCompletionHandle;


@end
