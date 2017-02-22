//
//  newsTableViewDelegate.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray*array;

@end
