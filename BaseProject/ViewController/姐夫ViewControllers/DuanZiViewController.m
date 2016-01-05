//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuanZiViewController.h"
#import "BaiSiListViewModel.h"
#import "BaiSiDuanZiCell.h"

@interface DuanZiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong )UITableView *tableView;
@property(nonatomic ,strong )BaiSiListViewModel *DuanZiVM;

@end

@implementation DuanZiViewController

- (id)init{
    if (self=[super init]) {
        self.title=@"内涵段子";
        self.tabBarItem.image = [UIImage imageNamed:@"noneFansIcon"];
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = kNaviTitleColor;
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [self.tabBarItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
    }
    return self;
}


- (BaiSiListViewModel *)DuanZiVM{
    if (!_DuanZiVM) {
        _DuanZiVM = [[BaiSiListViewModel alloc]initWithNewsListType:NewsListTypeDuanZi];
    }
    return _DuanZiVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BaiSiDuanZiCell class] forCellReuseIdentifier:@"Cell"];
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
        [self.DuanZiVM refreshDataCompletionHandle:^(NSError *error)
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
        [self.DuanZiVM getMoreDataCompletionHandle:^(NSError *error) {
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
    return self.DuanZiVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiSiDuanZiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.nameLb.text = [self.DuanZiVM nameForRow:indexPath.row];
    cell.passTimeLb.text = [self.DuanZiVM passtimeForRow:indexPath.row];
    cell.textLb.text = [self.DuanZiVM textForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.DuanZiVM profileImageURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"f_jiong"]];
    cell.loveLb.text = [self.DuanZiVM loveForRow:indexPath.row];
    cell.hateLb.text =[self.DuanZiVM hateForRow:indexPath.row];
    cell.repostLb.text = [self.DuanZiVM repostForRow:indexPath.row];
    cell.commentLb.text = [self.DuanZiVM commentForRow:indexPath.row];
    
    return cell;

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
