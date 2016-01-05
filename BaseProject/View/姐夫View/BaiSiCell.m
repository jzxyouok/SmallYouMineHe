//
//  BaiSiCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiSiCell.h"

@implementation BaiSiCell
- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:16];
    }
    return _nameLb;
}

- (UILabel *)passTimeLb {
    if(_passTimeLb == nil) {
        _passTimeLb = [[UILabel alloc] init];
        _passTimeLb.font = [UIFont systemFontOfSize:12];
        _passTimeLb.textColor = [UIColor grayColor];
    }
    return _passTimeLb;
}
- (UILabel *)loveLb {
    if(_loveLb == nil) {
        _loveLb = [[UILabel alloc] init];
        _loveLb.font = [UIFont systemFontOfSize:13];
        _loveLb.textColor = [UIColor grayColor];
    }
    return _loveLb;
}

- (UILabel *)hateLb {
    if(_hateLb == nil) {
        _hateLb = [[UILabel alloc] init];
        _hateLb.font = [UIFont systemFontOfSize:13];
        _hateLb.textColor = [UIColor grayColor];
    }
    return _hateLb;
}

- (UILabel *)repostLb {
    if(_repostLb == nil) {
        _repostLb = [[UILabel alloc] init];
        _repostLb.font = [UIFont systemFontOfSize:13];
        _repostLb.textColor = [UIColor grayColor];
    }
    return _repostLb;
}
- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = [UIFont systemFontOfSize:13];
        _commentLb.textColor = [UIColor grayColor];
    }
    return _commentLb;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameLb];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.passTimeLb];
        [self.contentView addSubview:self.loveLb];
        [self.contentView addSubview:self.hateLb];
        [self.contentView addSubview:self.repostLb];
        [self.contentView addSubview:self.commentLb];
        //头像
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        self.iconIV.layer.cornerRadius = 30/2;
        
        [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(-1);
            
        }];
        [self.passTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(2);
        }];
        [self.loveLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.hateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.loveLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hateLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.repostLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    
    return self;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
