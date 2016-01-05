//
//  JieFuNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "JieFuModel.h"
@interface JieFuNetManager : BaseNetManager
+ (id)getJieFuWithpageNum:(NSInteger)pageNum kCompletionHandle;

@end
