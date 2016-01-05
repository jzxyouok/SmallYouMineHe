//
//  ZBCategoryDetailCell.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryDetailCell.h"

@implementation ZBCategoryDetailCell
-(TRImageView *)iconView{
    if (!_iconView) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}

-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [self.contentView addSubview:_nameLb];
        _nameLb.font = [UIFont systemFontOfSize:11];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}
@end
