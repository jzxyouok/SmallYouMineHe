//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "JieFuViewController.h"
#import "JieFuViewModel.h"
#import "JieFuVideoCell.h"



@interface JieFuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong )UITableView *tableView;
@property(nonatomic ,strong )JieFuViewModel *videoVM;
@end

@implementation JieFuViewController

- (id)init{
    if (self=[super init]) {
        self.title=@"搞笑视频";
        self.tabBarItem.image = [UIImage imageNamed:@"ic_feedback_nor"];
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = kNaviTitleColor;
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [self.tabBarItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
    }
    return self;
}


- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[JieFuVideoCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (JieFuViewModel *)videoVM {
    if(_videoVM == nil) {
        _videoVM = [[JieFuViewModel alloc] init];
    }
    return _videoVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videoVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    JieFuVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLb.text = [self.videoVM titleForRow:indexPath.row];
    [cell.videoIV setImageWithURL:[self.videoVM picPathURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    cell.upNumLb.text = [self.videoVM upNumForRow:indexPath.row];
    cell.downNumLb.text = [self.videoVM downNumForRow:indexPath.row];
    cell.commentNumLb.text = [self.videoVM commentNumForRow:indexPath.row];
    cell.shareNumLb.text = [self.videoVM shareNumForRow:indexPath.row];
    cell.clickNumLb.text = [self.videoVM clickNumForRow:indexPath.row];
    cell.gifPath = [self.videoVM gifPathForRow:indexPath.row];
    
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
