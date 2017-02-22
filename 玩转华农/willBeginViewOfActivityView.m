//
//  willBeginViewOfActivityView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/1.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "willBeginViewOfActivityView.h"
#import "Masonry.h"

@interface willBeginViewOfActivityView(){
    NSTimer*timefire;
    UILabel*time;
    UILabel*second;
    UILabel*m;
}
@end


@implementation willBeginViewOfActivityView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    timefire=[NSTimer timerWithTimeInterval:1 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timefire forMode:NSRunLoopCommonModes];
    [timefire fire];
    
    UIImageView*imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fire.png"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(@35);

    }];
    
    UIImageView*imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic3.jpg"]];
    [self addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).offset(5);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
        make.bottom.mas_equalTo(-15);
    }];
    
    
    UILabel*label=[[UILabel alloc] init];
    label.text=@"这里是活动标题";
    
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView2.mas_top).offset(-7);
        make.left.mas_equalTo(imageView2.mas_right).offset(5);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.4);
        make.height.mas_equalTo(@30);
    }];
    
    UILabel*start=[UILabel new];
    start.text=@"距离开始";
    start.textColor=[UIColor grayColor];
    
    [self addSubview:start];
    
    CGFloat a=CGRectGetWidth(self.frame);
    
    [start mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(5);
        make.left.mas_equalTo(imageView2.mas_right).offset(a/5-8);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    
    time=[UILabel new];
    time.backgroundColor=[UIColor blackColor];
    time.textColor=[UIColor whiteColor];
    time.text=@"03";
    time.font=[UIFont systemFontOfSize:20];
    time.textAlignment=NSTextAlignmentCenter;
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(start.mas_bottom).offset(5);
        make.left.mas_equalTo(imageView2.mas_right).offset(10);
        make.bottom.mas_equalTo(imageView2.mas_bottom);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.1);
    }];
    
    UILabel*timeLabel=[UILabel new];
    timeLabel.text=@"时";
    timeLabel.font=[UIFont systemFontOfSize:12];
    timeLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(time.mas_top);
        make.left.mas_equalTo(time.mas_right);
        make.height.mas_equalTo(time.mas_height);
        make.width.mas_equalTo(time.mas_width).multipliedBy(0.45);
    }];

    second=[UILabel new];
    second.text=@"30";
    second.textAlignment=NSTextAlignmentCenter;
    second.backgroundColor=[UIColor blackColor];
    second.textColor=[UIColor whiteColor];
    second.font=[UIFont systemFontOfSize:20];
    [self addSubview:second];
    [second mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(start.mas_bottom).offset(5);
        make.left.mas_equalTo(timeLabel.mas_right);
        make.bottom.mas_equalTo(imageView2.mas_bottom);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.1);
        
    }];
    
    UILabel*secondLabel=[UILabel new];
    secondLabel.text=@"分";
    secondLabel.font=[UIFont systemFontOfSize:12];
    secondLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:secondLabel];
    [secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(second.mas_top);
        make.left.mas_equalTo(second.mas_right);
        make.height.mas_equalTo(second.mas_height);
        make.width.mas_equalTo(second.mas_width).multipliedBy(0.45);
    }];
    
    m=[UILabel new];
    m.text=@"40";
    m.textAlignment=NSTextAlignmentCenter;
    m.backgroundColor=[UIColor blackColor];
    m.textColor=[UIColor whiteColor];
    m.font=[UIFont systemFontOfSize:20];
    [self addSubview:m];
    [m mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(start.mas_bottom).offset(5);
        make.left.mas_equalTo(secondLabel.mas_right);
        make.bottom.mas_equalTo(imageView2.mas_bottom);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.1);
    }];
    
    UILabel*mLabel=[UILabel new];
    mLabel.text=@"秒";
    mLabel.font=[UIFont systemFontOfSize:12];
    m.textAlignment=NSTextAlignmentCenter;
    [self addSubview:mLabel];
    [mLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(m.mas_top);
        make.left.mas_equalTo(m.mas_right).offset(2);
        make.height.mas_equalTo(m.mas_height);
        make.width.mas_equalTo(m.mas_width).multipliedBy(0.45);
    }];
 
}

-(void)changeTime{

    
    if([m.text intValue]>0)
    {
        [self time:m flag:2];
        
    }
    else
    {
        if([second.text intValue]>0)
        {
            [self time:second flag:1];
            m.text=@"60";
        }
        else
        {
            if([time.text intValue]>0)
            {
              [self time:time flag:0];
              second.text=@"60";
            }
            
        }
    }
    
}

-(void)time:(UILabel*)label flag:(int)a{
    int c=[label.text intValue];
    switch (a) {
        case 0:
            if(c>0)
            {
                label.text=[self handleTime:c];
                
            }
            break;
         case 1:
            if(c>0)
            {
                label.text=[self handleTime:c];
                
                
            }
            break;
        case 2:
            if(c>0)
            {
                label.text=[self handleTime:c];
            }
            
        default:
            break;
    }
    
}

-(NSString*)handleTime:(int)c{
    NSString*string;
    if(c-1>=10) string=[NSString stringWithFormat:@"%d",c-1];
    else string=[NSString stringWithFormat:@"%d",c-1];
    return string;
}

-(void)dealloc{
    [timefire invalidate];
}

@end
