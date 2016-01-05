//
//  JieFuDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuPianDetailViewController.h"

@interface TuPianDetailViewController ()<UIGestureRecognizerDelegate>

@end

@implementation TuPianDetailViewController
- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = [UIColor whiteColor];
       self.imageView.frame = CGRectMake(10, 10, kWindowW-10, kWindowH-10);

    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //开启图片的用户交互功能
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    //设置初始状态
    [self loadImageView];
    // 添加pan手势
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:panGR];
    // 添加缩放
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinchGR.delegate = self;
    [self.imageView addGestureRecognizer:pinchGR];
//  添加旋转
//  UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
//    rotationGR.delegate = self;
//    [self.imageView addGestureRecognizer:rotationGR];
    
    // 添加tap手势 点击两下
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGR];
   
    //添加点击一下的手势
    UITapGestureRecognizer *tapGR1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
    tapGR.numberOfTapsRequired = 1;
    [self.imageView addGestureRecognizer:tapGR1];
    
}

-(void)pan:(UIPanGestureRecognizer *)gr
{
    // 读取self.view下的偏移量，搭配修改center属性，因为center是参考self.view坐标系
    //    CGPoint translate = [gr translationInView:self.view];
    //    CGPoint center = self.imageView.center;
    //    center.x+=translate.x;
    //    center.y +=translate.y;
    //    self.imageView.center= center;
    //    [gr setTranslation:CGPointZero inView:self.view]
    // 读取imageView下的偏移量，搭配修改transform属性中的translate，因为translate是参考self.imageView坐标系
    CGPoint translate = [gr translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform,0, translate.y*1.5);
    [gr setTranslation:CGPointZero inView:self.imageView];
}

-(void)pinch:(UIPinchGestureRecognizer *)gr{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, gr.scale, gr.scale);
    gr.scale = 1;
}

-(void)rotation:(UIRotationGestureRecognizer *)gr
{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, gr.rotation);
    gr.rotation = 0;
}
-(void)tap:(UITapGestureRecognizer *)gr
{
    [self loadImageView];
}

-(void)tap1:(UITapGestureRecognizer *)gr
{
//    if (self.view.backgroundColor == [UIColor whiteColor]) {
//        self.view.backgroundColor = [UIColor blackColor];
//        self.imageView.backgroundColor = [UIColor blackColor];
//    }else{
//        self.view.backgroundColor = [UIColor whiteColor];
//        self.imageView.backgroundColor = [UIColor whiteColor];
//    }
    
    
}

-(void)loadImageView
{
    // 显示到中间
    self.imageView.center = self.view.center;
    
    // 缩放，看到全部
    CGFloat scaleX = self.view.bounds.size.width/self.imageView.bounds.size.width;
    CGFloat scaleY = self.view.bounds.size.height/self.imageView.bounds.size.height;
    CGFloat scale = MIN(scaleX, scaleY);
    self.imageView.transform = CGAffineTransformMakeScale(scale, scale);
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}





@end
