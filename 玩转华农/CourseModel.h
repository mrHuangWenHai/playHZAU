//
//  CourseModel.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/27.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject
@property(nonatomic,copy)NSString*courseName;
@property(nonatomic,strong)NSString*colors;
@property(nonatomic,assign)NSInteger weekDay;
@property(nonatomic,assign)NSInteger end;
@property(nonatomic,assign)NSInteger start;


@end
