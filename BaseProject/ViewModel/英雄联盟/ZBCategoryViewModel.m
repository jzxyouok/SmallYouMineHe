//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"

@implementation ZBCategoryViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}

-(ZBCategoryModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 总共行数 */
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 某行tag值 */
-(NSString *)tagForRow:(NSInteger)row{
    
    return [self modelForRow:row].tag;
}
/** 某行内容 */
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}




@end
