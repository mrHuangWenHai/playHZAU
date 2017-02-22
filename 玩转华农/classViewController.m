//
//  classViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/2/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "classViewController.h"
#import "head.h"
#import "choseView.h"
#import "Utils.h"

@implementation classViewController{
    UISegmentedControl*segment;
    UITableView*tableView;
    NSArray*array;
    choseView*selectView;
}

-(instancetype)init{
    self.title=@"教室查询";
    self.navigationController.navigationBarHidden=NO;

    return [super init];
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    segment=[[UISegmentedControl alloc] initWithItems:@[@"一教",@"二教",@"三教",@"四教"]];
    [self.view addSubview:segment];
    segment.backgroundColor=[UIColor whiteColor];
    segment.tintColor=[UIColor grayColor];
    segment.momentary=NO;
    
    [segment addTarget:self action:@selector(classListQuery:) forControlEvents:UIControlEventValueChanged];
    
    
    tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 120, appWide, appHight-120)];
    [self.view addSubview:tableView];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tableFooterView=[[UIView alloc] init];
    selectView=[[choseView alloc] init];
    selectView.layer.cornerRadius=5;
    selectView.layer.masksToBounds=YES;
    selectView.backgroundColor=[Utils colorWithHexString:@"#FF5722"];
    tableView.backgroundColor=[Utils colorWithHexString:@"#FFEA00"];
    [self.view addSubview:selectView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancel) name:@"cancel" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sumbit:) name:@"sumbit" object:nil];
   


    
    

    
}

-(void)cancel{
    tableView.backgroundColor=[UIColor whiteColor];
    self.view.backgroundColor=[UIColor whiteColor];
    segment.selectedSegmentIndex=UISegmentedControlNoSegment;
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;

}
-(void)sumbit:(NSNotification*)noti{
    NSLog(@"11111");
        array=@[@"臣妾查不到啊",@"臣妾查不到啊",@"臣妾查不到啊",@"臣妾查不到啊",@"臣妾查不到啊",@"臣妾查不到啊"];
    tableView.backgroundColor=[UIColor whiteColor];
    self.view.backgroundColor=[UIColor whiteColor];
    selectView.hidden=YES;
    CATransition*animation=[CATransition animation];
    animation.subtype=kCATransitionFromTop;
    animation.type=kCATransitionReveal;
    animation.duration=2;
    [selectView.layer addAnimation:animation forKey:nil];
    [tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"asdfasdf");
    return array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mycell=@"staticCell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:mycell];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mycell];
    }
    NSLog(@"%@",array[indexPath.row]);
    cell.textLabel.text=array[indexPath.row];
    return cell;
    
}



-(void)viewWillLayoutSubviews{
    segment.frame=CGRectMake(appWide/2-appWide/4*3/2-10, 80,appWide/4*3+10 , 40);
    [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.edges.equalTo(self.superview).with.insets(UIEdgeInsetsMake(60, 30, 30, 30));
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(30);
        make.bottom.mas_equalTo(-30*2);
        make.right.mas_equalTo(-30);
        
    }];
    selectView.hidden=YES;
   
    


}

-(void)classListQuery:(UISegmentedControl*)segment{
    selectView.hidden=NO;
    self.view.backgroundColor= [Utils colorWithHexString:@"#ccccce"];

    tableView.backgroundColor=[Utils colorWithHexString:@"#ccccce"];
    [UIView animateWithDuration:2 animations:^{
        selectView.alpha=0;
        selectView.alpha=1;
    }];
    
}

-(void)dealloc{
    NSLog(@"aaaaaaaaaaaaaaaaaa");
}

@end
