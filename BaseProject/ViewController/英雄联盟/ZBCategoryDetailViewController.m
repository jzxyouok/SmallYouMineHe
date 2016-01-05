//
//  ZBCategoryDetailViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryDetailViewController.h"
#import "ZBCategoryDetailCell.h"
#import "ZBCategoryDetailViewModel.h"
#import "ZBDetailViewController.h"
@interface ZBCategoryDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) ZBCategoryDetailViewModel *itemVM;
@end

@implementation ZBCategoryDetailViewController
- (id)initWithTag:(NSString *)tag name:(NSString *)name{
    if (self = [super init]) {
        self.tag = tag;
        self.title = name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

-(ZBCategoryDetailViewModel *)itemVM{
    if (!_itemVM) {
        _itemVM = [[ZBCategoryDetailViewModel alloc] initWithTag:self.tag];
    }
    return _itemVM;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:self.collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.itemVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[ZBCategoryDetailCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView.header beginRefreshing];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBCategoryDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.itemVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
    cell.nameLb.text = [self.itemVM itemNameForRow:indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBDetailViewController *vc = [[ZBDetailViewController alloc] initWithitemID:[self.itemVM modelForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}

@end
