//
//  SearchDetailViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation SearchDetailViewController
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"召唤师详情";
    [self.webView loadRequest:_request];
}

-(id)initWithRequest:(NSURLRequest *)request{
    if (self = [super init]) {
        self.request = request;
        //推出来  不显示下方栏
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

#pragma mark - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项,跳转到下一页
    if (navigationType != 5) {
        SearchDetailViewController *detailVC = [[SearchDetailViewController alloc] initWithRequest:request];
        [self.navigationController pushViewController:detailVC animated:YES];
        return NO;
    }
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}

@end
