//
//  LatestCell.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestCell.h"

@implementation LatestCell
-(TRImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 60));
            make.bottom.mas_equalTo(-10);
            
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.numberOfLines = 0;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin);
        }];
    }
    return _titleLb;
}

-(UILabel *)dateLb{
    if (!_dateLb) {
        _dateLb = [[UILabel alloc] init];
        _dateLb.font = [UIFont systemFontOfSize:13];
        _dateLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
        }];
    }
    return _dateLb;
}

-(UILabel *)commentLb{
    if (!_commentLb) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = [UIFont systemFontOfSize:13];
        _commentLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_commentLb];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
        }];
    }
    return _commentLb;
}
@end
