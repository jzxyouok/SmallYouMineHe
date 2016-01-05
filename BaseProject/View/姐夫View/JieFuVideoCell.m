//
//  JieFuVideoCell.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JieFuVideoCell.h"
#import "JieFuViewModel.h"


@interface JieFuVideoCell ()<AVPlayerViewControllerDelegate>
@property (nonatomic,strong)AVPlayerViewController *vc;
@end

@implementation JieFuVideoCell

- (NSURL *)gifPath {
    if(_gifPath == nil) {
        _gifPath = [[NSURL alloc] init];
    }
    return _gifPath;
}


- (UILabel *)textLb {
    if(_textLb == nil) {
        _textLb = [[UILabel alloc] init];
        _textLb.font = [UIFont systemFontOfSize:15];
        _textLb.numberOfLines = 0;
    }
    return _textLb;
}

- (UILabel *)upNumLb {
    if(_upNumLb == nil) {
        _upNumLb = [[UILabel alloc] init];
        _upNumLb.font = [UIFont systemFontOfSize:13];
        _upNumLb.textColor = [UIColor grayColor];
    }
    return _upNumLb;
}

- (UILabel *)downNumLb {
    if(_downNumLb == nil) {
        _downNumLb = [[UILabel alloc] init];
        _downNumLb.font = [UIFont systemFontOfSize:13];
        _downNumLb.textColor = [UIColor grayColor];
    }
    return _downNumLb;
}

- (UILabel *)commentNumLb {
    if(_commentNumLb == nil) {
        _commentNumLb = [[UILabel alloc] init];
        _commentNumLb.font = [UIFont systemFontOfSize:13];
        _commentNumLb.textColor = [UIColor grayColor];
    }
    return _commentNumLb;
}

- (UILabel *)shareNumLb {
    if(_shareNumLb == nil) {
        _shareNumLb = [[UILabel alloc] init];
        _shareNumLb.font = [UIFont systemFontOfSize:13];
        _shareNumLb.textColor = [UIColor grayColor];
    }
    return _shareNumLb;
}

- (UILabel *)clickNumLb {
    if(_clickNumLb == nil) {
        _clickNumLb = [[UILabel alloc] init];
        _clickNumLb.font = [UIFont systemFontOfSize:13];
        _clickNumLb.textColor = [UIColor whiteColor];
    }
    return _clickNumLb;
}

- (UIButton *)playBtn {
    if(_playBtn == nil) {
        _playBtn = [[UIButton alloc] init];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"icon_play2"] forState:UIControlStateNormal];
        [self.videoIV addSubview:_playBtn];
        //按钮点击事件
        [_playBtn bk_addEventHandler:^(id sender) {
            _playBtn.selected = !_playBtn.selected;
            AVPlayer *player = [AVPlayer playerWithURL:self.gifPath];
            _vc = [JieFuVideoCell standAVC];
            _vc.player = player;
            if ( _playBtn.selected) {
                [_vc.player play];
            }else{
                [_vc.player pause];
            }
            [self.videoIV addSubview:_vc.view];     
            [_vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
            
            _vc.delegate = self;
            
        } forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _playBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.textLb];
        [self.contentView addSubview:self.videoIV];
        [self.contentView addSubview:self.upNumLb];
        [self.contentView addSubview:self.downNumLb];
        [self.contentView addSubview:self.commentNumLb];
        [self.contentView addSubview:self.shareNumLb];
        [self.videoIV addSubview:self.clickNumLb];
        [self.videoIV addSubview:self.playBtn];
        
        [self.textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(5);
        }];

        
        [self.upNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.downNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.upNumLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.commentNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downNumLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.shareNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentNumLb.mas_right).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        [self.clickNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(5);
        }];
        [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];

        
    }
    return self;
}

//视频
- (UIImageView *)videoIV {
    if(_videoIV == nil) {
        _videoIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_videoIV];
        _videoIV.backgroundColor = [UIColor blackColor];
        [self.videoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(self.textLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.bottom.mas_equalTo(-40);
            make.height.mas_equalTo(275);
            
        }];
    
        self.playBtn.hidden = NO;
        _videoIV.userInteractionEnabled = YES;
    }
    return _videoIV;
}

//显示时长和播放次数
- (UIView *)playView {
    if(_playView == nil) {
        _playView = [[UIView alloc] init];
        [self.videoIV addSubview:_playView];
        _playView.alpha = 0.5;
        _playView.backgroundColor = [UIColor blackColor];
        [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(8);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(30);
        }];
    }
    return _playView;
}
/** 单元格复用解决方法 */
- (void)prepareForReuse{
    [super prepareForReuse];
    if ([JieFuVideoCell standAVC].view.superview == self.videoIV) {
        [[JieFuVideoCell standAVC].view removeFromSuperview];
        [JieFuVideoCell standAVC].player = nil;
    }
}

//单例创建
+ (AVPlayerViewController *)standAVC {
    static AVPlayerViewController *avc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        avc = [AVPlayerViewController new];
    });
    return avc;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
