//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBCategoryViewModel : BaseViewModel

/** 总共行数 */
@property(nonatomic,assign)NSInteger rowNumber;
/** 某行tag值 */
-(NSString *)tagForRow:(NSInteger)row;
/** 某行内容 */
-(NSString *)textForRow:(NSInteger)row;
@end
