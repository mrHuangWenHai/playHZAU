//
//  timeAndEndOfActivity.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/9.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "timeAndEndOfActivity.h"
#import "UIView+SDAutoLayout.h"
#import "Utils.h"

@implementation timeAndEndOfActivity

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setup];
    }
    
    return self;
}

-(void)setup{
    UIView*contentView=self.contentView;
    UIView*view=[UIView new];
    view.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [contentView addSubview:view];
    
    UILabel*place=[UILabel new];
    place.text=@"先锋书店(五台山店)";
    [contentView addSubview:place];
    
    UILabel*startTime=[UILabel new];
    startTime.text=@"开始时间：2016-04-15 19：30";
    startTime.font=[UIFont systemFontOfSize:13];
    startTime.textColor=[UIColor grayColor];
    [contentView addSubview:startTime];
    
    UILabel*endTime=[UILabel new];
    endTime.text=@"结束时间：2016-04-15 21：30";
    endTime.font=[UIFont systemFontOfSize:13];
    endTime.textColor=[UIColor grayColor];
    [contentView addSubview:endTime];
    
    UILabel*endJoin=[UILabel new];
    endJoin.text=@"报名截止：2016-04-15 21：30";
    endJoin.font=[UIFont systemFontOfSize:13];
    endJoin.textColor=[UIColor grayColor];
    [contentView addSubview:endJoin];
    
    UIView*view1=[UIView new];
    view1.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [contentView addSubview:view1];
    
    view.sd_layout
    .leftSpaceToView(contentView,0)
    .rightEqualToView(contentView)
    .topEqualToView(contentView)
    .heightIs(10);
    
    place.sd_layout
    .leftSpaceToView(contentView,5)
    .topSpaceToView(view,8)
    .rightEqualToView(contentView)
    .heightIs(20);
    
    startTime.sd_layout
    .leftSpaceToView(contentView,5)
    .topSpaceToView(place,2)
    .rightEqualToView(contentView)
    .heightIs(15);
    
    endTime.sd_layout
    .leftSpaceToView(contentView,5)
    .topSpaceToView(startTime,2)
    .rightEqualToView(contentView)
    .heightIs(15);
    
    endJoin.sd_layout
    .leftSpaceToView(contentView,5)
    .topSpaceToView(endTime,2)
    .rightEqualToView(contentView)
    .heightIs(15);
    
    view1.sd_layout
    .leftSpaceToView(contentView,0)
    .topSpaceToView(endJoin,0)
    .rightEqualToView(contentView)
    .heightIs(10);
    
}
@end
