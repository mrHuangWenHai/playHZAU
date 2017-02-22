//
//  newsTableViewCell.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "news.h"

@interface newsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageHead;
@property (strong, nonatomic) IBOutlet UILabel *detail;

@property (strong, nonatomic) IBOutlet UILabel *title;
@property(strong,nonatomic)news*model;

@end
