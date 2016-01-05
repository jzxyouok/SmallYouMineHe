//
//  JieFuNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JieFuNetManager.h"

#define kJieFuDataPath = @"http://api.jiefu.tv/app2/api/article/list.html?mediaType=2&deviceCode=4E4928BE77A9DF1E01F14BC7A9DE6758&token=&pageNum=0&pageSize=20"

@implementation JieFuNetManager
+ (id)getJieFuWithpageNum:(NSInteger)pageNum completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://api.jiefu.tv/app2/api/article/list.html?mediaType=2&deviceCode=4E4928BE77A9DF1E01F14BC7A9DE6758&token=&pageNum=%@&pageSize=20",@(pageNum)];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([JieFuModel objectWithKeyValues:responseObj],error );
    }];
    
    
}
@end
