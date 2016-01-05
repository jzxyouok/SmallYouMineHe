//
//  ShiPinViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuPianViewController.h"
#import "BaiSiListViewModel.h"
#import "BaiSiShengYinCell.h"
#import "TuPianDetailViewController.h"

@interface TuPianViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong )UITableView *tableView;
@property(nonatomic ,strong )BaiSiListViewModel *TuPianVM;
@end

@implementation TuPianViewController

- (id)init{
    if (self=[super init]) {
        self.title=@"它的图片";
        self.tabBarItem.image = [UIImage imageNamed:@"follow_me_no_data_tip"];
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = kNaviTitleColor;
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [self.tabBarItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
    }
    return self;
}


- (BaiSiListViewModel *)TuPianVM{
    if (!_TuPianVM) {
        _TuPianVM = [[BaiSiListViewModel alloc]initWithNewsListType:NewsListTypeTuPian];
    }
    return _TuPianVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BaiSiShengYinCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.TuPianVM refreshDataCompletionHandle:^(NSError *error)
         {
             if (error)
             {
                 {
                     [self showErrorMsg:error.localizedDescription];
                 }
                 if (error.code == 999) {
                     [self.tableView.footer endRefreshingWithNoMoreData];
                 }  else{
                     [_tableView.footer endRefreshing];
                 }
             }
             else{
                 [self.tableView reloadData];
             }
             //没有更多数据
             [_tableView.footer resetNoMoreData];
             [_tableView.header endRefreshing];
         }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.TuPianVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [_tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.TuPianVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiSiShengYinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.nameLb.text = [self.TuPianVM nameForRow:indexPath.row];
    cell.passTimeLb.text = [self.TuPianVM passtimeForRow:indexPath.row];
    cell.textLb.text = [self.TuPianVM textForRow:indexPath.row];
    [cell.cdnIV setImageWithURL:[self.TuPianVM image1ForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"搜索界面为空"]];
    [cell.iconIV.imageView setImageWithURL:[self.TuPianVM profileImageURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"f_meng"]];
    cell.loveLb.text = [self.TuPianVM loveForRow:indexPath.row];
    cell.hateLb.text =[self.TuPianVM hateForRow:indexPath.row];
    cell.repostLb.text = [self.TuPianVM repostForRow:indexPath.row];
    cell.commentLb.text = [self.TuPianVM commentForRow:indexPath.row];
    cell.clickLb.text = @"点击图片查看详情";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TuPianDetailViewController *vc = [TuPianDetailViewController new];
    [vc.imageView setImageWithURL:[self.TuPianVM cdnImgForRow:indexPath.row]];
    vc.title = @"图片详情";
    [Factory addBackItemToVC:vc];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewAutomaticDimension;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.TuPianVM heightImg1ForRow:indexPath.row]+120;
}


@end
