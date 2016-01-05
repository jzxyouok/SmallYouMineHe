//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"


@implementation ToolMenuViewModel
/** 不是分页,只实现geteData方法即可 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        [self.dataArr removeObjectAtIndex:1];
        [self.dataArr removeObjectAtIndex:1];
        [self.dataArr removeObjectAtIndex:4];
        completionHandle(error);
    }];
}

-(ToolMenuModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}



-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}

- (NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}

- (ToolMenuItemType)itemTypeForRow:(NSInteger)row{
    NSString *type = [self modelForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return ToolMenuItemTypeNative;
    }
    if ([type isEqualToString:@"web"]) {
        return ToolMenuItemTypeWeb;
    }
    return 0;
}



@end
