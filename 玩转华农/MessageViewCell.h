//
//  MessageViewCell.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/6/2.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Friend;

@interface MessageViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView*headImage;
@property(nonatomic,strong)UILabel*name;
@property(nonatomic,strong)UILabel*message;
@property(nonatomic,strong)UILabel*time;
@property(nonatomic,strong)UILabel*noread_number;
-(void)loadModel:(Friend*)friend;
@end
