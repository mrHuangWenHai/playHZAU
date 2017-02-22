//
//  clockView.m
//  test6
//
//  Created by 黄文海 on 16/4/3.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "clockView.h"
#include "Utils.h"
@interface clockView(){
    UIDatePicker*datePicker;
    UIView*view;
}
@end
@implementation clockView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setup];
        //self.backgroundColor=[Utils colorWithHexString:@"7f7f7f"];
        //self.alpha=[UIColor co];
    }
    
    return self;
}

-(void)setup{
    
    CGFloat width=CGRectGetWidth(self.bounds);
    CGFloat height=CGRectGetHeight(self.bounds)/2;
    UIView*balckground=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height*2)];
    balckground.backgroundColor=[Utils colorWithHexString:@"7f7f7f"];
    [self addSubview:balckground];
    balckground.alpha=0.5;
    
    UIView*toolView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
    toolView.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    view=[[UIView alloc] init];
    view.frame=CGRectMake(0,height+64, width  ,height-64);
    view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(width-40, 5, 30, 30);
    [toolView addSubview:button];
    UIButton*cancel=[UIButton buttonWithType:UIButtonTypeSystem];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelButton) forControlEvents:UIControlEventTouchUpInside];
    cancel.frame=CGRectMake(5, 5, 30, 30);
    [toolView addSubview:cancel];
    [view addSubview:toolView];
    
    
    datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,40 , width, height-104)];
    NSLog(@"%@",[NSLocale availableLocaleIdentifiers]);
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [datePicker setCalendar:[NSCalendar currentCalendar]];
    [datePicker setTimeZone:[NSTimeZone systemTimeZone]];
    [datePicker setDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    datePicker.backgroundColor=[UIColor whiteColor];
    [view addSubview:datePicker];
    [self addSubview:view];
    CATransition*animation=[CATransition animation];
    animation.type=kCATransitionPush;
    animation.subtype=kCATransitionFromTop;
    animation.duration=0.3;
    [view.layer addAnimation:animation forKey:nil];
    
    
}

-(void)cancelButton{
    [self removeFromSuperview];
}

-(void)ok{
    NSDate *selected = [datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    NSLog(@"%@",destDateString);
    _cell.detailTextLabel.text=destDateString;
    _time[_a]=destDateString;
    [self removeFromSuperview];

    
}



@end
