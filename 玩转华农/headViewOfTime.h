//
//  headViewOfTime.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/24.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^chatInGroup)();
@interface headViewOfTime : UIView
@property(nonatomic,strong)NSTimer*pageChange;
@property(nonatomic,copy)chatInGroup chat;
-(void)startTime;

@end
