//
//  headNewsView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "headNewsView.h"
#import "Utils.h"
#import "head.h"
@interface headNewsView()<UIScrollViewDelegate>{
    UIScrollView*scrollView;
    UIPageControl*page;
    NSMutableArray*detailArray;
    UILabel*title;

}
@end
@implementation headNewsView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setUp];
    }
    
    return self;
}

-(void)setUp{
    CGFloat width=CGRectGetWidth(self.bounds);
    CGFloat height=CGRectGetHeight(self.bounds);
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollView.contentSize=CGSizeMake(width*5, height);
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;
    scrollView.delegate=self;
    
    page=[[UIPageControl alloc] init];
    page.frame=CGRectMake(width-60, height-25, 30, 25);
    page.currentPage=0;
    page.numberOfPages=5;
    page.pageIndicatorTintColor=[UIColor grayColor];
    page.hidesForSinglePage=YES;
    [page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGFloat a=height;
    UIImageView*imageview1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, a)];
    imageview1.image=[UIImage imageNamed:@"1"];
    UIImageView*imageView2=[[UIImageView alloc] initWithFrame:CGRectMake(width,0,width,a)];
    imageView2.image=[UIImage imageNamed:@"2"];
    UIImageView*imageView3=[[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, width, a)];
    imageView3.image=[UIImage imageNamed:@"3"];
    UIImageView*imageView4=[[UIImageView alloc] initWithFrame:CGRectMake(width*3, 0, width, a)];
    imageView4.image=[UIImage imageNamed:@"4"];
    UIImageView*imageView5=[[UIImageView alloc] initWithFrame:CGRectMake(width*4, 0, width, a)];
    imageView5.image=[UIImage imageNamed:@"4"];
    
    
    UIView*view=[[UIView alloc] initWithFrame:CGRectMake(0, height/6*5, width, 15)];
    view.backgroundColor=[Utils colorWithHexString:@"f2f2f2"];
    [self addSubview:view];
    
    detailArray=[NSMutableArray arrayWithObjects:@"四月天，晒晒你的花花世界",@"春风吹绿了芭蕉",@"回荡思念的滚烫",@"云水边静沐暖阳",@"回荡思念的滚烫",@"读来又热了眼眶",nil];
    title=[[UILabel alloc] initWithFrame:CGRectMake(10,a-30 , width, 30)];
    title.textColor=[UIColor whiteColor];
    title.text=detailArray[0];
    
    CAGradientLayer*shadomLayer=[CAGradientLayer layer];
    shadomLayer.colors=@[(id)[UIColor clearColor],(id)[UIColor blackColor].CGColor];
    shadomLayer.frame=CGRectMake(0, a-50,width, 50);
    shadomLayer.opacity=0.3;
    
    [scrollView addSubview:imageview1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];
    [scrollView addSubview:imageView4];
    [scrollView addSubview:imageView5];
    [self addSubview:scrollView];
    [self addSubview:page];
    [self addSubview:title];
    [self.layer addSublayer:shadomLayer];
    
}

-(void)startTime{
    self.pageChange=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(page) userInfo:NULL repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_pageChange forMode:NSRunLoopCommonModes];
    self.pageChange.fireDate=[NSDate dateWithTimeInterval:2 sinceDate:[NSDate date]];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self pasue];
}


-(void)changePage:(id)sender{
    
    NSInteger pa=[sender currentPage];
    CGRect bounds=scrollView.bounds;
    bounds.origin.x=CGRectGetWidth(bounds)*pa;
    bounds.origin.y=0;
    [scrollView scrollRectToVisible:bounds animated:YES];
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_pageChange invalidate];
    _pageChange=nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTime];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self pasue];
}

-(void)page{
    page.currentPage=(page.currentPage+1)%5;
    [scrollView setContentOffset:CGPointMake(page.currentPage*appWide, 0) animated:YES];
}

-(void)pasue{
    CGFloat pageWidth=CGRectGetWidth(scrollView.frame);
    NSUInteger page1=floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    if(page1==5)
    {
        page.currentPage=0;
        CGRect bounds=scrollView.bounds;
        bounds.origin.x=0;
        bounds.origin.y=0;
        [scrollView scrollRectToVisible:bounds animated:NO];
        
    }
    else
        page.currentPage=page1;
        title.text=detailArray[page.currentPage];
    
    
}




@end
