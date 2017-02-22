//
//  showActivityController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/8.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "showActivityController.h"
#import "searchHeadView.h"
#import "head.h"
#import "introduceModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "introduceCell.h"
#import "timeAndEndOfActivity.h"
#import "builderOfShowActivityCell.h"
#import "Utils.h"

@interface showActivityController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation showActivityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc] init];
    [self.view addSubview:_tableView];
    searchHeadView*headView=[[searchHeadView alloc] initWithFrame:CGRectMake(0, 0, appWide, 288)];
    _tableView.tableHeaderView=headView;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.dataArray=[NSMutableArray array];
    introduceModel*model=[[introduceModel alloc] init];
    _dataArray[0]=model;
    
    UIView*view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, appWide, 150)];
    CALayer*layer=[CALayer layer];
    layer.frame=CGRectMake(0, 0, appWide, 1);
    layer.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"].CGColor;
    [view.layer addSublayer:layer];
    UILabel*label=[[UILabel alloc] initWithFrame:CGRectMake(appWide/2-30, 40, 80, 20)];
    label.text=@"求评论.....";
    label.textColor=[UIColor grayColor];
    [view addSubview:label];
    _tableView.tableFooterView=view;
    
    self.button=[UIButton buttonWithType:UIButtonTypeSystem];
    _button.backgroundColor=[Utils colorWithHexString:@"#f17a5c"];
    _button.frame=CGRectMake(10, appHight-50, appWide-20, 45);
    [_button setTitle:@"我要报名" forState:UIControlStateNormal];
    _button.tintColor=[UIColor whiteColor];
    [self.view addSubview:_button];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0)
    {
    id model=_dataArray[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[introduceCell class] contentViewWidth:[self cellContentViewWith]];
    }
    else{
        if(indexPath.row==1) return 50;
        else
        {
            if(indexPath.row==2) return 125;
            else
                if(indexPath.row==3) return 111;
        }
    }
    return 40;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell;
    if(indexPath.row==0)
    {
      cell=[tableView dequeueReusableCellWithIdentifier:@"0"];
      if(cell==nil) cell=[[introduceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"0"];
        introduceCell*mycell=(introduceCell*)cell;
        mycell.model=_dataArray[indexPath.row];
        [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];

    }
    if(indexPath.row==1)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"1"];
        if(cell==nil) cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
        cell.imageView.image=[UIImage imageNamed:@"cl"];
        cell.textLabel.text=@"时间匹配";
        cell.accessoryView=nil;
        
    }
    if(indexPath.row==2)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"2"];
        if(cell==nil) cell=[[timeAndEndOfActivity alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"2"];
    }
    if(indexPath.row==3)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"3"];
        if(cell==nil) cell=[[builderOfShowActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"3"];
    }
    if(indexPath.row==4)
    {
        cell=[tableView dequeueReusableCellWithIdentifier:@"1"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
        }
        cell.textLabel.text=@"评论（0）";
        UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"AlbumOperateMoreHL"] forState:UIControlStateNormal];
        [button setTitle:@"评论" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.frame=CGRectMake(0, 0, 100, 40);
        UIEdgeInsets insets=UIEdgeInsetsMake(0, 20, 0, 0);
        button.imageEdgeInsets=insets;
        UIEdgeInsets inset=UIEdgeInsetsMake(-70, 0, -70, -30);
        button.titleEdgeInsets=inset;
        
        cell.accessoryView=button;
    }
   
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)viewWillLayoutSubviews{
    _tableView.frame=CGRectMake(0, 0, appWide, appHight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}



@end
