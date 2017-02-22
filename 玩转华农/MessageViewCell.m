//
//  MessageViewCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/6/2.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "MessageViewCell.h"
#import "head.h"
#import "Friend.h"

@implementation MessageViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.headImage = [[UIImageView alloc] init];
        self.name = [[UILabel alloc] init];
        self.message = [[UILabel alloc] init];
        self.time = [[UILabel alloc] init];
        self.noread_number = [[UILabel alloc] init];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUp];
    }
    return self;
}

-(void)setUp{
    _headImage.frame = CGRectMake(5, 5, 40, 40);
    _headImage.layer.cornerRadius = 20;
    _headImage.layer.masksToBounds = true;
    _headImage.layer.shouldRasterize = true;
    _name.frame = CGRectMake(50, 5, appWide*0.6, 20);
    _name.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _message.frame = CGRectMake(50, 25, appWide*0.7, 20);
    _message.textColor = [UIColor grayColor];
    _time.frame =CGRectMake(appWide-80, 5,70 , 20);
    _time.font = [UIFont systemFontOfSize:10];
    _time.textColor = [UIColor grayColor];
    _noread_number.frame = CGRectMake(appWide-40, 25, 20, 20);
    [self.contentView addSubview:_headImage];
    [self.contentView addSubview:_name];
    [self.contentView addSubview:_message];
    [self.contentView addSubview:_time];
    [self.contentView addSubview:_noread_number];
}

-(void)loadModel:(Friend*)friend{
    _headImage.image = [UIImage imageNamed:friend.headImageUrl];
    _name.text = friend.name;
    _message.text = friend.message;
    NSLog(@"%@",_message.text);
    _time.text = friend.time;
    _noread_number.text = friend._noread_number;
}


@end
