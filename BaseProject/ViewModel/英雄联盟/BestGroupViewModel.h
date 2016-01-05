//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

//总要拼接，做宏
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

@interface BestGroupViewModel : BaseViewModel
/** 总共行数 */
@property(nonatomic,assign)NSInteger rowNumber;
/** 某行标题 */
-(NSString *)titleForRow:(NSInteger)row;
/** 某行第一个头像 */
-(NSURL *)oneheroForRow:(NSInteger)row;
/** 某行第二个头像 */
-(NSURL *)twoheroForRow:(NSInteger)row;
/** 某行第三个头像 */
-(NSURL *)threeheroForRow:(NSInteger)row;
/** 某行第四个头像 */
-(NSURL *)fourheroForRow:(NSInteger)row;
/** 某行第五个头像 */
-(NSURL *)fiveheroForRow:(NSInteger)row;
/** 某行内容描述 */
-(NSString *)desForRow:(NSInteger)row;

/** 英雄头像URL数组 */
- (NSArray *)iconURLsForRow:(NSInteger)row;

/** 英雄描述数组 */
- (NSArray *)descsForRow:(NSInteger)row;

@end
