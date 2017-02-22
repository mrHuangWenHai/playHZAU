//
//  ClipsHeadImageViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ClipsHeadImageViewController.h"
#import "Masonry.h"
#import "head.h"

@interface ClipsHeadImageViewController ()<UIScrollViewDelegate>{
    UIButton*button;
    UIButton*cancel;
}

@end

@implementation ClipsHeadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, appWide, appHight)];
    self.scrollView.contentSize=CGSizeMake(appWide, appHight);
    self.scrollView.contentInset=UIEdgeInsetsMake(60, 60, 60, 60);
    
    _scrollView.showsHorizontalScrollIndicator=true;
    _scrollView.showsVerticalScrollIndicator=true;
    [self.view addSubview:_scrollView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _imageView.frame=CGRectMake(0, 0, appWide, appHight);
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_imageView];
    _scrollView.backgroundColor=[UIColor blackColor];
    _imageView.userInteractionEnabled=true;
    _scrollView.userInteractionEnabled=true;
    _scrollView.delegate=self;
    _scrollView.maximumZoomScale=3;
    _scrollView.minimumZoomScale=1;
    _imageView.backgroundColor=[UIColor blackColor];
    
    [self addDoubleTapOnScrollView];
    [self createClips];
    
    button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(sumbit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    cancel=[UIButton buttonWithType:UIButtonTypeSystem];
    [cancel setTintColor:[UIColor whiteColor]];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
    
}

-(void)sumbit{
    
    CGRect rect=CGRectMake(appWide/2-90, appHight/3,200, 200);
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    UIImage*new=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImage*image=new;
    CGImageRef srcImage=[image CGImage];
    
    CGImageRef imageRef=CGImageCreateWithImageInRect(srcImage, rect);
    
    UIImage* newImage=[UIImage imageWithCGImage:imageRef];
    _finshImage(newImage);
    [self dismissViewControllerAnimated:true completion:nil];

}

-(void)cancel{
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}

-(void)viewWillLayoutSubviews{
    
    button.frame=CGRectMake(10, appHight*0.9, 70, 40);
    cancel.frame=CGRectMake(appWide*0.8, appHight*0.9, 70, 40);
    
}

-(void)createClips{
    CGRect _cropRect=CGRectMake(appWide/3, appHight/3, 200, 200);
    
    
    // 画圆角矩形
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(appWide/2-90, appHight/3, _cropRect.size.width, _cropRect.size.width) cornerRadius:90];
    
    UIBezierPath *cornerPath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(appWide/2-90, appHight/3, _cropRect.size.width, _cropRect.size.width) cornerRadius:90];
    cornerPath1.lineWidth=40;
    CAShapeLayer*d=[CAShapeLayer layer];
    d.path=cornerPath1.CGPath;
    d.fillColor=[UIColor clearColor].CGColor;
    d.strokeColor=[UIColor whiteColor].CGColor;
    
    
    // 贝斯曲线反扫描的区域。从xy开始扫，扫的高度为height，宽度为width
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds)   , CGRectGetHeight(self.view.bounds)) cornerRadius:0];
    
    [path appendPath:cornerPath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.name = @"fillLayer";
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.6;
    
    [self.view.layer addSublayer:fillLayer];
    [self.view.layer addSublayer:d];

}

-(void)addDoubleTapOnScrollView{
    UITapGestureRecognizer*doubleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired=2;
    [self.scrollView addGestureRecognizer:doubleTap];
}

-(void)doubleTapAction:(UITapGestureRecognizer*)tap{
    
    NSLog(@"66666666");
    CGFloat scale=1;
    NSLog(@"_scrollView.zoomScale=%f",_scrollView.zoomScale);
    if(_scrollView.zoomScale!=3.0){
        scale=3;
    }else{
        scale=1;
    }
    
    CGRect zoomRect=[self zoomRectForScale:scale withCenter:[tap locationInView:tap.view]];
    [_scrollView zoomToRect:zoomRect animated:YES];
    
}

-(CGRect)zoomRectForScale:(CGFloat)scale withCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height=_scrollView.frame.size.height/scale;
    zoomRect.size.width=_scrollView.frame.size.width/scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width  /2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height /2.0);
    return zoomRect;

    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
  //  return scrollView.subviews[0];
    return _imageView;
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
