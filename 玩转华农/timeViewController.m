//
//  timeViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/2/29.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "timeViewController.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "buildActivity.h"
#import "activityTableViewCell1.h"
#import "activityShow.h"
#import "headViewOfTime.h"
#import "Utils.h"
#import "buildActivityViewController.h"
#import "head.h"
#import "showActivityController.h"
#import "viewBeginController.h"

@interface timeViewController (){
    headViewOfTime*headView;
}
@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,strong)NSMutableArray*array;
@property(nonatomic,strong)buildActivityViewController*buildView;

@end

@implementation timeViewController

-(instancetype)init{
    
    if(self=[super init])
    self.title=@"活动列表";
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.tableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableview.delegate=self;
    _tableview.dataSource=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_tableview];
    
    
    self.array=[NSMutableArray array];
    for(int i=0;i<10;i++)
    {
        activityShow*show=[[activityShow alloc] init];
        show.time=@"2016-6-6";
        show.titleActivity=@"中国美女哪里最多";
        if(i%2==0)
        show.urlImage=@"2";
        else
            show.urlImage=@"pbg";
        show.number=@"已报人数:6";
        show.place=@"华中农业大学";
        [_array addObject:show];
        
    }
    
    UIBarButtonItem*rightButton=[[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(diss)];
    
    
    self.navigationItem.rightBarButtonItems=@[rightButton];
   [self.tableview registerClass:[activityTableViewCell1 class] forCellReuseIdentifier:@"ID"];
    
    headView=[[headViewOfTime alloc] initWithFrame:CGRectMake(0, 0,appWide, appHight/4*3-45)];
    
    __weak typeof (self)weakself=self;
    
    headView.chat=^(){
        [weakself push];
    };
    
    
    

}


-(void)diss{
    
    self.buildView=[[buildActivityViewController alloc] init];
    [self.navigationController pushViewController:_buildView animated:YES];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    showActivityController*show=[[showActivityController alloc] init];
    [self.navigationController pushViewController:show animated:YES];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellId=@"ID";
    activityTableViewCell1*cell=(activityTableViewCell1*)[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell=[[activityTableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    cell.model=_array[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"testtesttest%lu",indexPath.row);
    buildActivity* model=_array[indexPath.row];
    return [self.tableview cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[activityTableViewCell1 class] contentViewWidth:self.view.frame.size.width];
}



-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor ]}];
    
    [self.navigationController.navigationBar setBarTintColor:[Utils colorWithHexString:@"#2fb791"]];
    [headView startTime];
    NSLog(@"11111");
   

}



-(void)viewDidAppear:(BOOL)animated{
    //_buildView=nil;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [headView.pageChange invalidate];
}



- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

-(void)viewWillLayoutSubviews{
    
    self.tableview.tableHeaderView=headView;
    _tableview.frame=CGRectMake(0, 64, CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds)-45);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"timetimetimetimetime");
}

-(void)push{
    viewBeginController*viewBegin=[[viewBeginController alloc] init];
    [self.navigationController pushViewController:viewBegin animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
