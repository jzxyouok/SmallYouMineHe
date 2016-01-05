//
//  BaiSiShengYinCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiShengYinCell.h"

@implementation BaiSiShengYinCell
- (TTTAttributedLabel *)textLb {
    if(_textLb == nil) {
        _textLb = [TTTAttributedLabel new];
        _textLb.lineSpacing = 6;
        _textLb.font = [UIFont systemFontOfSize:16];
        _textLb.numberOfLines = 2;
        [self.contentView addSubview:self.textLb];
        [self.textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
        
    }
    return _textLb;
}

- (UIImageView *)cdnIV {
    if(_cdnIV == nil) {
        _cdnIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_cdnIV];
        [self.cdnIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(self.textLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.bottom.mas_equalTo(-40);
        }];
    }
    return _cdnIV;
}
- (UILabel *)clickLb {
    if(_clickLb == nil) {
        _clickLb = [[UILabel alloc] init];
        _clickLb.font = [UIFont boldFlatFontOfSize:16];
        _clickLb.textColor = [UIColor blackColor];
        _clickLb.backgroundColor = [UIColor whiteColor];
        _clickLb.alpha = 0.4;
        [self.cdnIV addSubview:self.clickLb];
        [self.clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
        }];
    }
    return _clickLb;
}


@end
