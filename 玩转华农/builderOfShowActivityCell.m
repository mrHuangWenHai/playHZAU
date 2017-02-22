//
//  builderOfShowActivityCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/9.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "builderOfShowActivityCell.h"
#import "UIView+SDAutoLayout.h"
#import "Utils.h"
#import "head.h"

@implementation builderOfShowActivityCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    UIView*contentView=self.contentView;
    UILabel*label=[UILabel new];
    label.text=@"发起人";
    label.textAlignment=NSTextAlignmentCenter;
    [contentView addSubview:label];
    
    CALayer*layer=[CALayer layer];
    layer.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"].CGColor;
    [contentView.layer addSublayer:layer];
    layer.frame=CGRectMake(0, 30, appWide, 1);
    [contentView.layer addSublayer:layer];
    
    UIImageView*imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3"]];
    [contentView addSubview:imageView];
    
    UILabel*builderOfName=[UILabel new];
    builderOfName.text=@"先锋书店";
    [contentView addSubview:builderOfName];
    
    UILabel*time=[UILabel new];
    time.text=@"2016-04-08 17:37";
    time.font=[UIFont systemFontOfSize:12];
    [contentView addSubview:time];
    
    CALayer*back=[CALayer layer];
    back.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"].CGColor;
    back.frame=CGRectMake(0, 91, appWide, 10);
    [contentView.layer addSublayer:back];
    
    label.sd_layout
    .leftSpaceToView(contentView,5)
    .topSpaceToView(contentView,0)
    .widthIs(60)
    .heightIs(30);
    
    imageView.sd_layout
    .leftSpaceToView(contentView,10)
    .topSpaceToView(label,10)
    .widthIs(35)
    .heightIs(40);
    
    builderOfName.sd_layout
    .topEqualToView(imageView)
    .leftSpaceToView(imageView,8)
    .rightEqualToView(contentView)
    .heightIs(25);
    
    time.sd_layout
    .topSpaceToView(builderOfName,5)
    .leftSpaceToView(imageView,8)
    .rightEqualToView(contentView)
    .heightIs(10);
    
    
    
}
@end
