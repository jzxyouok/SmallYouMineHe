//
//  JiShuViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JiShuViewController.h"
#import "TRImageView.h"
#import "LatestViewModel.h"
#import "LatestCell.h"
#import "DetailViewController.h"
@interface JiShuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)LatestViewModel *latestVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation JiShuViewController
-(LatestViewModel *)latestVM{
    if (!_latestVM) {
        _latestVM = [[LatestViewModel alloc] initWithNewsListType:NewsListTypeJiShu];
    }
    return _latestVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[LatestCell class] forCellReuseIdentifier:@"Cell"];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.latestVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView.header endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];
        
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.latestVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView.footer endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];
    }
    return _tableView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"技术";
        self.tabBarItem.image = [UIImage imageNamed:@"discoveryfunction_10"];
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = kNaviTitleColor;
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [self.tabBarItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.latestVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LatestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.latestVM titleForRow:indexPath.row];
    cell.dateLb.text = [self.latestVM dateForRow:indexPath.row];
    cell.commentLb.text = [self.latestVM commentNumberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.latestVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

kRemoveCellSeparator

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [[DetailViewController alloc] initWithID:[self.latestVM IDForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
