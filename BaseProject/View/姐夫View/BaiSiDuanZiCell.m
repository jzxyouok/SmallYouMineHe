//
//  BaiSiDuanZiCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiDuanZiCell.h"

@implementation BaiSiDuanZiCell
- (TTTAttributedLabel *)textLb {
    if(_textLb == nil) {
        _textLb = [TTTAttributedLabel new];
        _textLb.lineSpacing = 6;
        _textLb.font = [UIFont systemFontOfSize:16];
        _textLb.numberOfLines = 0;
        
        [self.contentView addSubview:self.textLb];
        
        [self.textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
            make.bottom.mas_equalTo(-40);
        }];
        
    }
    return _textLb;
}



@end
