//
//  cutImageView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/31.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "cutImageView.h"
#import "head.h"
@interface cutImageView()<UIGestureRecognizerDelegate>{
    UIImageView*imageView;
    CGPoint lastPoint;
   // UIView*myView;
    CALayer*layer;
    CGRect rect ;
    CALayer*shapeLayer;
    CALayer*shape;
    UIButton*button;
    UIButton*cancel;
    
}
@end


@implementation cutImageView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setInit];
    }
    return self;
}

-(void)setInit{
    imageView=[[UIImageView alloc] init];
    UIPanGestureRecognizer*pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    imageView.userInteractionEnabled=YES;
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    pan.delegate=self;
    self.backgroundColor=[UIColor blackColor];
    lastPoint.x=-1;
    [self addSubview:imageView];
    
    [self addGestureRecognizer:pan];
    layer=[CALayer layer];
    layer.backgroundColor=[UIColor colorWithWhite:1 alpha:0].CGColor;
    layer.borderWidth=2;
    layer.borderColor=[UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
    button=[[UIButton alloc] init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(butt) forControlEvents:UIControlEventTouchUpInside];
    
    cancel=[UIButton new];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];

    shapeLayer=[CALayer layer];
    shapeLayer.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7].CGColor;
    [self.layer addSublayer:shapeLayer];

    shape=[CALayer layer];
    shape.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7].CGColor;
    [self.layer addSublayer:shape];
    [self addSubview:button];
    [self addSubview:cancel];



    
}

-(void)setUpImage:(UIImage*)image{
    
    imageView.image=image;
    
}

-(void)butt{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage*new=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImage*image=new;
    CGImageRef srcImage=[image CGImage];
    
    CGImageRef imageRef=CGImageCreateWithImageInRect(srcImage, rect);
    
    
    UIImage* newImage=[UIImage imageWithCGImage:imageRef];
    

    
    [_delegate finshImage:newImage];
    
}

-(void)pan:(UIPanGestureRecognizer*)pan{
    NSLog(@"222222222");
    CGPoint currentPoint=[pan locationInView:self];
    
    
    if(currentPoint.y>lastPoint.y)
    {
        CGFloat less=currentPoint.y-lastPoint.y;
        
        CGRect fram=imageView.frame;
        fram.origin.y+=less;
        imageView.frame=fram;
    }
    else
    {
        if(currentPoint.y<lastPoint.y)
        {
            CGFloat less=lastPoint.y-currentPoint.y;
            
            
            CGRect fram=imageView.frame;
            fram.origin.y-=less;
            imageView.frame=fram;
            
        }
    }
    lastPoint=currentPoint;
    
    
    
}
-(void)layoutSubviews{
    static BOOL first=true;
    
    layer.frame=CGRectMake(0,CGRectGetHeight(self.bounds)/2-90 , CGRectGetWidth(self.bounds),180);
    shapeLayer.frame=CGRectMake(0, 0,CGRectGetWidth(self.bounds) , CGRectGetHeight(self.bounds)/2-90 );
    shape.frame=CGRectMake(0, appHight/2+90, appWide, appHight/2-90);
    button.frame=CGRectMake(20, appHight-50, 80, 20);
    cancel.frame=CGRectMake(appWide-100, appHight-50, 80, 20);
    
    if(first)
    {
        imageView.frame=self.bounds;
        rect=layer.frame;
        first=false;
    }
    
    
    
}

-(void)cancel{
    [self removeFromSuperview];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    lastPoint=[gestureRecognizer locationInView:self];
    return YES;
}


@end
