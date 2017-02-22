//
//  buildActivity.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/15.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface buildActivity : NSObject
//这个是正式的
@property(nonatomic,copy)NSString*headImageUrl;
@property(nonatomic,copy)NSString*endTime;
@property(nonatomic,copy)NSString*activityName;
@property(nonatomic,copy)NSString*introduce;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSArray*scenceImage;
@property(nonatomic,copy)NSString*place;

@end
