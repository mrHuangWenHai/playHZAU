//
//  activityTableViewCell1.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/17.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "activityTableViewCell1.h"
#import "UIView+SDAutoLayout.h"
#import "Utils.h"

#import "picturlView.h"

@implementation activityTableViewCell1{
    UILabel*time;
    UILabel*place;
    UILabel*title;
    UIImageView*imageView;
    UILabel*number;
    
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setup];
    }
    
    return self;
}

-(void)setup{
    time=[UILabel new];
    place=[UILabel new];
    title=[UILabel new];
    imageView=[[UIImageView alloc] init];
    number=[UILabel new];
    number.textColor=[UIColor whiteColor];
    UIView*view=[[UIView alloc] init];
    view.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    UIImageView*imageView1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alarm"]];
    UIImageView*imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location"]];
    
    
    NSArray*ay=@[title,time,place,imageView,view,imageView2,imageView1];
    [self.contentView sd_addSubviews:ay];
    UIFont*font=[UIFont systemFontOfSize:13];
    title.font=font;
    place.font=[UIFont systemFontOfSize:10];
    time.font=[UIFont systemFontOfSize:10];
    number.font=[UIFont systemFontOfSize:12];
    
    imageView.sd_layout
    .topSpaceToView(self.contentView,6)
    .leftSpaceToView(self.contentView,5)
    .rightSpaceToView(self.contentView,5)
    .heightIs(150);
    
    
    
    title.sd_layout
    .topSpaceToView(imageView,5)
    .leftSpaceToView(self.contentView,5)
    .rightEqualToView(self.contentView)
    .heightIs(25);
    
    imageView1.sd_layout
    .topSpaceToView(title,5)
    .leftSpaceToView(self.contentView,5)
    .heightIs(15)
    .widthIs(15);
    
    time.sd_layout
    .topSpaceToView(title,5)
    .leftSpaceToView(imageView1,5)
    .rightSpaceToView(self.contentView,0)
    .heightIs(25);
    
    imageView2.sd_layout
    .topSpaceToView(imageView1,5)
    .leftSpaceToView(self.contentView,5)
    .widthIs(15)
    .heightIs(15);
    
    place.sd_layout
    .topSpaceToView(time,10)
    .leftSpaceToView(imageView2,5)
    .rightSpaceToView(self.contentView,0)
    .heightIs(25);
    
    view.sd_layout
    .topSpaceToView(place,5)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(15);
    
    imageView.frame=CGRectMake(100, 100, 100, 150);
    number.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-80, CGRectGetHeight(imageView.bounds)-15, 20, 20);
    CAGradientLayer*shadomLayer=[CAGradientLayer layer];
    shadomLayer.colors=@[(id)[UIColor clearColor],(id)[UIColor blackColor].CGColor];
    shadomLayer.frame=CGRectMake(0, 120, CGRectGetWidth([UIScreen mainScreen].bounds)-10, 30);
    shadomLayer.opacity=0.8;
   // imageView.sd_layout.heightIs(150);
    [imageView.layer addSublayer:shadomLayer];
    [imageView addSubview:number];
    
    [self setupAutoHeightWithBottomView:view bottomMargin:5];
    
}

-(void)print{
    NSLog(@"ccccccccc");
}

-(void)setModel:(activityShow*)model{
    
    _model=model;
    title.text=_model.titleActivity;
    place.text=_model.place;
    time.text=_model.time;
    number.text=_model.number;
    imageView.image=[UIImage imageNamed:_model.urlImage];
//    number.frame=CGRectMake(CGRectGetWidth(imageView.bounds)-63, CGRectGetHeight(imageView.bounds)-15, 20, 20);
//    imageView.frame=CGRectMake(100, 100, 100, 100);
//    CAGradientLayer*shadomLayer=[CAGradientLayer layer];
//    shadomLayer.colors=@[(id)[UIColor clearColor],(id)[UIColor blackColor].CGColor];
//    shadomLayer.frame=CGRectMake(0, 120, CGRectGetWidth(self.contentView.bounds)-10, 30);
//    shadomLayer.opacity=0.5;
//    imageView.sd_layout.heightIs(150);
//    [imageView.layer addSublayer:shadomLayer];
    
    
    
    [number sizeToFit];
    [title sizeToFit];
    [place sizeToFit];
    [time sizeToFit];
//    [imageView addSubview:number];
    
}





@end
