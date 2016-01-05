//
//  ZBDetailViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBDetailViewModel : BaseViewModel
/** 用来传物品的id */
-(id)initWithitemID:(NSInteger)itemID;
@property(nonatomic,assign)NSInteger itemID;
/** 物品图片 */
-(NSURL *)geticonIV;
/** 物品名称 */
-(NSString *)getName;
/** 物品价格 */
-(NSInteger)getPrice;
/** 物品总价格 */
-(NSInteger)getallPrice;
/** 物品售价 */
-(NSInteger)getsellPrice;
/** 物品属性 */
-(NSString *)getDesc;

/** 获得合成需求ID */
-(NSString *)getNeed;
/** 获得可合成ID */
-(NSString *)getCompose;



@end
