//
//  tableViewDelegate.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/26.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface tableViewDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)UITableView*table;
@property(nonatomic,weak)UIViewController*prensent;

@end
