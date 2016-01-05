//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBCategoryDetailViewController.h"
@interface ZBCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)ZBCategoryViewModel *zbVM;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ZBCategoryViewController
-(ZBCategoryViewModel *)zbVM{
    if (!_zbVM) {
        _zbVM = [ZBCategoryViewModel new];
    }
    return _zbVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        //_tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"装备分类";
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.zbVM.rowNumber;
}

kRemoveCellSeparator

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    UIView *yellowView = [UIView new];
    yellowView.backgroundColor=kRGBColor(254, 249, 236);
    cell.selectedBackgroundView=yellowView;
    cell.textLabel.text = [self.zbVM textForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCategoryDetailViewController *vc = [[ZBCategoryDetailViewController alloc] initWithTag:[self.zbVM tagForRow:indexPath.row] name:[self.zbVM textForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
