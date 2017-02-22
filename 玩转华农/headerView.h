//
//  headerView.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/26.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol reloadTableView
-(void)reloadThisTableView;
@end


@interface headerView : UITableViewHeaderFooterView
-(instancetype)headrViewWithTableView:(UITableView*)tableView;
@property(nonatomic,weak)id<reloadTableView>delegate;

@end
