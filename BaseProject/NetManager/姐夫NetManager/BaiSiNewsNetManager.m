//
//  DuanZiNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiNewsNetManager.h"


@implementation BaiSiNewsNetManager

+ (id)getNewsListType:(NewsListType)type maxtime:(NSInteger)maxtime completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = nil;
    switch (type) {
        case NewsListTypeShiPin:
            path = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=%@&type=41",@(maxtime)];
            
            break;
        case NewsListTypeTuPian:
            path = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=%@&type=10",@(maxtime)];
            
            break;
        case NewsListTypeDuanZi:
            path = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=%@&type=29",@(maxtime)];
            
            break;
        case NewsListTypeShengYin:
            path = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=list&appname=bsbdjmimi&asid=C6041ECB-AE22-4612-8BAB-10F4C4D8BCA3&c=video&client=iphone&device=ios%%20%%E8%%AE%%BE%%E5%%A4%%87&from=ios&jbk=0&mac=&market=&maxtime=%@&openudid=3957d144b675a83b89d4e154acdb68a85d41db72&page=3&per=20&sub_flag=1&type=31&udid=&ver=3.0",@(maxtime)];
            
            break;
        default:
            break;
    }
    
    
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BaiSiNewsModel objectWithKeyValues:responseObj],error);
    }];
    
}


@end
