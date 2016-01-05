//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "JieFuTabBarController.h"
#import "CarsHomeTabController.h"
#import "TuWanViewController.h"
#import "DuoWanTabBarController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *itemNames;
@end

@implementation LeftViewController
-(NSArray *)itemNames{
    return @[@"它汽车",@"它暴雪",@"它内涵",@"它联盟"];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        //去掉分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:240/255.0 alpha:1.0];
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = 1;
    return cell;
}

kRemoveCellSeparator

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[CarsHomeTabController standardCarsInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[TuWanViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        case 2:
            [self.sideMenuViewController setContentViewController:[JieFuTabBarController standardInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        case 3:
            [self.sideMenuViewController setContentViewController:[DuoWanTabBarController standardInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //触发以下tableView的懒加载
    [self.tableView reloadData];
}

@end
