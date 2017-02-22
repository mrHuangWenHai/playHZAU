//
//  FriendGroup.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject
@property(nonatomic,strong)NSMutableDictionary*friendGroup;
-(void)loadData:(void(^)())finsh;
@end
