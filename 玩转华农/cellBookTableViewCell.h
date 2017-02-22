//
//  cellBookTableViewCell.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/5.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"cellModal.h"

@interface cellBookTableViewCell : UITableViewCell
@property(nonatomic,strong)cellModal*modal;
-(void)reloadModal:(cellModal *)modal;
@end
