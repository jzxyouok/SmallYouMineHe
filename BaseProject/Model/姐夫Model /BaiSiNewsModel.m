//
//  DuanZiModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiNewsModel.h"

@implementation BaiSiNewsModel
+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [NewsListModel class]};
}

@end

@implementation NewsInfoModel

@end

@implementation NewsListModel
//驼峰转下划线
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


