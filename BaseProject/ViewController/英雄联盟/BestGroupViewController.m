//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "TRImageView.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailViewController.h"

#define kIconSpace  (kWindowW - 52 * 5)/6

@interface BestGroupCell : UITableViewCell
/** 标题 */
@property(nonatomic,strong)UILabel *titleLb;
/** 第一个英雄头像 */
@property(nonatomic,strong)TRImageView *oneheroView;
/** 第二个英雄头像 */
@property(nonatomic,strong)TRImageView *twoheroView;
/** 第三个英雄头像 */
@property(nonatomic,strong)TRImageView *threeheroView;
/** 第四个英雄头像 */
@property(nonatomic,strong)TRImageView *fourheroView;
/** 第五个英雄头像 */
@property(nonatomic,strong)TRImageView *fiveheroView;
/** 某行内容描述 */
@property(nonatomic,strong)UILabel *desLb;
@end

@implementation BestGroupCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *yelloView=[UIView new];
        yelloView.backgroundColor=kRGBColor(254, 249, 236);
        self.selectedBackgroundView=yelloView;
    }
    return self;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_offset(-10);
        }];
    }
    return _titleLb;
}

-(TRImageView *)oneheroView{
    if (!_oneheroView) {
        _oneheroView = [TRImageView new];
        [self.contentView addSubview:_oneheroView];
        [_oneheroView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kIconSpace);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _oneheroView;
}
-(TRImageView *)twoheroView{
    if (!_twoheroView) {
        _twoheroView = [TRImageView new];
        [self.contentView addSubview:_twoheroView];
        [_twoheroView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.oneheroView.mas_right).mas_equalTo(kIconSpace);
            make.centerY.mas_equalTo(self.oneheroView);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _twoheroView;
}
-(TRImageView *)threeheroView{
    if (!_threeheroView) {
        _threeheroView = [TRImageView new];
        [self.contentView addSubview:_threeheroView];
        [_threeheroView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.twoheroView.mas_right).mas_equalTo(kIconSpace);
            make.centerY.mas_equalTo(self.oneheroView);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _threeheroView;
}
-(TRImageView *)fourheroView{
    if (!_fourheroView) {
        _fourheroView = [TRImageView new];
        [self.contentView addSubview:_fourheroView];
        [_fourheroView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.threeheroView.mas_right).mas_equalTo(kIconSpace);
            make.size.mas_equalTo(CGSizeMake(52, 52));
            make.centerY.mas_equalTo(self.oneheroView);
        }];
    }
    return _fourheroView;
}
-(TRImageView *)fiveheroView{
    if (!_fiveheroView) {
        _fiveheroView = [TRImageView new];
        [self.contentView addSubview:_fiveheroView];
        [_fiveheroView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.fourheroView.mas_right).mas_equalTo(kIconSpace);
            make.size.mas_equalTo(CGSizeMake(52, 52));
            make.centerY.mas_equalTo(self.oneheroView);
        }];
    }
    return _fiveheroView;
}
-(UILabel *)desLb{
    if (!_desLb) {
        _desLb = [[UILabel alloc]init];
        [self.contentView addSubview:_desLb];
        _desLb.font = [UIFont systemFontOfSize:14];
        _desLb.textColor = [UIColor lightGrayColor];
        _desLb.numberOfLines = 2;
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.oneheroView.mas_bottom).mas_equalTo(10);
            make.bottom.right.mas_equalTo(-10);
            make.left.mas_equalTo(10);
        }];
    }
    return _desLb;
}

@end


@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)BestGroupViewModel *bestGroupVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BestGroupViewController
-(BestGroupViewModel *)bestGroupVM{
    if (!_bestGroupVM) {
        _bestGroupVM = [[BestGroupViewModel alloc] init];
    }
    return _bestGroupVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        //给个猜测的行高,让cell可以自行计算应该有的高度
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestGroupVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
    self.title = @"最佳阵容";
    [Factory addBackItemToVC:self];
    
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bestGroupVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.bestGroupVM titleForRow:indexPath.row];
    [cell.oneheroView.imageView setImageWithURL:[self.bestGroupVM oneheroForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    [cell.twoheroView.imageView setImageWithURL:[self.bestGroupVM twoheroForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    [cell.threeheroView.imageView setImageWithURL:[self.bestGroupVM threeheroForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    [cell.fourheroView.imageView setImageWithURL:[self.bestGroupVM fourheroForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    [cell.fiveheroView.imageView setImageWithURL:[self.bestGroupVM fiveheroForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    cell.desLb.text = [self.bestGroupVM desForRow:indexPath.row];
    return cell;
}


kRemoveCellSeparator

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc=[[BestGroupDetailViewController alloc] initWithTitle:[self.bestGroupVM titleForRow:indexPath.row] desc:[self.bestGroupVM desForRow:indexPath.row] icons:[self.bestGroupVM iconURLsForRow:indexPath.row] decs:[self.bestGroupVM descsForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
