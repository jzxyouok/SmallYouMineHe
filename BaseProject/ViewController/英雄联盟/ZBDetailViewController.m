//
//  ZBDetailViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBDetailViewController.h"
#import "ZBDetailViewModel.h"
#import "TRImageView.h"

@interface ZBDetailtopCell : UITableViewCell
@property(nonatomic,strong)TRImageView *image;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *allpriceLb;
@property(nonatomic,strong)UILabel *sellpriceLb;
@end

@implementation ZBDetailtopCell
-(TRImageView *)image{
    if (!_image) {
        _image = [TRImageView new];
        [self.contentView addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _image;
}
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.image);
            make.left.mas_equalTo(self.image.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}
-(UILabel *)priceLb{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        _priceLb.textColor = [UIColor lightGrayColor];
        _priceLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.titleLb);
        }];
    }
    return _priceLb;
}
-(UILabel *)allpriceLb{
    if (!_allpriceLb) {
        _allpriceLb = [UILabel new];
        _allpriceLb.textColor = [UIColor lightGrayColor];
        _allpriceLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_allpriceLb];
        [_allpriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.priceLb);
            make.left.mas_equalTo(self.priceLb.mas_right).mas_equalTo(5);
        }];
    }
    return _allpriceLb;
}
-(UILabel *)sellpriceLb{
    if (!_sellpriceLb) {
        _sellpriceLb = [UILabel new];
        _sellpriceLb.textColor = [UIColor lightGrayColor];
        _sellpriceLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_sellpriceLb];
        [_sellpriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.priceLb);
            make.left.mas_equalTo(self.allpriceLb.mas_right).mas_equalTo(5);
        }];
    }
    return _sellpriceLb;
}

@end

@interface ZBDetailCell : UITableViewCell
@property(nonatomic,strong)UILabel *descLb;
@end

@implementation ZBDetailCell

- (UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font=[UIFont systemFontOfSize:14];
        //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
        UIView *grayView = [UIView new];
        grayView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius = 4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end

@interface ZBDetailbottomCell : UITableViewCell
@property(nonatomic,strong)TRImageView *image1;
@property(nonatomic,strong)TRImageView *image2;
@property(nonatomic,strong)TRImageView *image3;

@end

@implementation ZBDetailbottomCell

-(TRImageView *)image1{
    if (!_image1) {
        _image1 = [[TRImageView alloc] init];
        [self.contentView addSubview:_image1];
        [self.image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _image1;
}
- (TRImageView *)image2 {
    if(_image2 == nil) {
        _image2 = [[TRImageView alloc] init];
        [self.contentView addSubview:_image2];
        [self.image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.image1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.image1);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _image2;
}

- (TRImageView *)image3 {
    if(_image3 == nil) {
        _image3 = [[TRImageView alloc] init];
        [self.contentView addSubview:self.image3];
        [self.image3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.image2.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.image1);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _image3;
}

@end

@interface ZBDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ZBDetailViewModel *zbdetailVM;
@end

@implementation ZBDetailViewController
-(id)initWithitemID:(ZBItemModel *)itemModel{
    if (self = [super init]) {
        self.itemModel = itemModel;
        self.title = @"装备详情";
        [Factory addBackItemToVC:self];
    }
    return self;
}

-(ZBDetailViewModel *)zbdetailVM{
    if (!_zbdetailVM) {
        _zbdetailVM = [[ZBDetailViewModel alloc] initWithitemID:self.itemModel.ID];
    }
    return _zbdetailVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbdetailVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView.header endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];

        [_tableView registerClass:[ZBDetailCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[ZBDetailtopCell class] forCellReuseIdentifier:@"topCell"];
        [self.tableView registerClass:[ZBDetailbottomCell class] forCellReuseIdentifier:@"bottomCell"];
    }
    return _tableView;
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@" ",@"装备属性",@"合成需求",@"可合成"][section];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZBDetailtopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
        [cell.image.imageView setImageWithURL:[self.zbdetailVM geticonIV] placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
        cell.titleLb.text = [self.zbdetailVM getName];
        NSInteger price = [self.zbdetailVM getPrice];
        NSInteger allprice = [self.zbdetailVM getallPrice];
        NSInteger sellprice = [self.zbdetailVM getsellPrice];
        cell.priceLb.text = [NSString stringWithFormat:@"价格:%ld",price];
        cell.allpriceLb.text = [NSString stringWithFormat:@"总价格:%ld",allprice];
        cell.sellpriceLb.text = [NSString stringWithFormat:@"售价:%ld",sellprice];
        return cell;
    }else if (indexPath.section == 1){
        ZBDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.descLb.text = [self.zbdetailVM getDesc];
        return cell;
    }else if (indexPath.section == 2){
        ZBDetailbottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bottomCell"];
        NSArray *arr = [[self.zbdetailVM getNeed] componentsSeparatedByString:@","];
        NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",[arr objectAtIndex:0]]];
        [cell.image1.imageView setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"f_shenma"]];
        return cell;
    }else{
        ZBDetailbottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bottomCell"];
        NSArray *arr = [[self.zbdetailVM getCompose] componentsSeparatedByString:@","];
        NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",[arr objectAtIndex:0]]];
        [cell.image1.imageView setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"f_shenma"]];
        return cell;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kRGBColor(246, 247, 251);
    [self.tableView.header beginRefreshing];
}




@end
