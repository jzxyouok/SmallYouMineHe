//
//  ZBDetailViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBDetailViewModel.h"

@implementation ZBDetailViewModel
-(ZBDetailModel *)getModel{
    return self.dataArr.firstObject;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getItemDetailWithItemId:_itemID completionHandle:^(ZBDetailModel  *model, NSError *error) {
        if (!error) {
            [self.dataArr addObject:model];
        }
        completionHandle(error);
    }];
}

-(id)initWithitemID:(NSInteger)itemID{
    if (self = [super init]) {
        self.itemID = itemID;
    }
    return self;
}

/** 物品图片 */
-(NSURL *)geticonIV{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",[self getModel].ID]];
}
/** 物品名称 */
-(NSString *)getName{
    return [self getModel].name;
}
/** 物品价格 */
-(NSInteger)getPrice{
    return [self getModel].price;
}
/** 物品总价格 */
-(NSInteger)getallPrice{
    return  [self getModel].allPrice;
}
/** 物品售价 */
-(NSInteger)getsellPrice{
    return [self getModel].sellPrice;
}
/** 物品属性 */
-(NSString *)getDesc
{
    return  [self getModel].desc;
}

/** 获得合成需求ID */
-(NSString *)getNeed{
    return [self getModel].need;
}
/** 获得可合成ID */
-(NSString *)getCompose{
    return [self getModel].compose;
}

@end
