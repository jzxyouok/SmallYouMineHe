//
//  ZBCategoryDetailViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBCategoryDetailViewModel : BaseViewModel
/** 总行数 */
@property(nonatomic,assign)NSInteger rowNumber;

/** 某行id */
- (NSInteger)itemIdForRow:(NSInteger)row;
/** 某行内容 */
- (NSString *)itemNameForRow:(NSInteger)row;

@property(nonatomic,strong) NSString *tag;
- (id)initWithTag:(NSString *)tag;

- (NSURL *)iconURLForRow:(NSInteger)row;


/** 声明这个方法来返回解析类 */
- (ZBItemModel *)modelForRow:(NSInteger)row;
@end
