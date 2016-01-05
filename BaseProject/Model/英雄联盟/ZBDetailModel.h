//
//  ZBDetailModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ExtattrsModel;
@interface ZBDetailModel : BaseModel

@property (nonatomic, strong) ExtattrsModel *extAttrs;

@property (nonatomic, copy) NSString *need;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, assign) NSInteger allPrice;

@property (nonatomic, assign) NSInteger sellPrice;

@property (nonatomic, copy) NSString *compose;

@property (nonatomic, copy) NSString *extDesc;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tags;

@end
@interface ExtattrsModel : NSObject

@property (nonatomic, assign) NSInteger FlatMPPoolMod;

@property (nonatomic, assign) NSInteger FlatMagicDamageMod;

@property (nonatomic, assign) CGFloat PercentBaseMPRegenMod;

@end

