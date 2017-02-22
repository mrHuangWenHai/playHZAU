//
//  ViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/2/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"
#import "classViewController.h"
#import "head.h"
#import "runningResearchViewController.h"
#import "Utils.h"
#import "timeViewController.h"
#import "searchBookViewController.h"
#import "DemoVC9.h"
#import "EaseMessageViewController.h"
#import "chatViewController.h"
#import "SignInViewController.h"
#import "newsTableViewDelegate.h"
#import "newsHeadTableViewCell.h"
#import "newsTableViewCell.h"
#import "CourseListController.h"
#import "FriendListViewController.h"



@interface ViewController (){
    UIScrollView*scrollView;
    UIButton*button1;
    UIButton *button2;
    UIButton*button3;
    UIButton*button4;
    UIButton*button5;
    UIButton*button6;
    UIButton*button7;
    newsTableViewDelegate*delegate;
  //  UIScrollView*scroll;
    CGPoint centerHigh[10];
    CGPoint centerLow[10];
    CGPoint centerMenu[10];
    
    SignInViewController*signIn;
}
@property(nonatomic,strong)    UIView*popView;
@property(nonatomic,strong) UITableView*tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"实时快讯";
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    delegate=[newsTableViewDelegate new];
    _tableView.delegate=delegate;
    _tableView.dataSource=delegate;

    [_tableView registerClass:[newsHeadTableViewCell class] forCellReuseIdentifier:@"head"];
    [_tableView registerNib:[UINib nibWithNibName:@"newsTableViewCell" bundle:nil] forCellReuseIdentifier:@"news"];

    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIEdgeInsets insets=UIEdgeInsetsMake(0, 0, -95, 0);
    button1=[UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"课程表" forState:UIControlStateNormal];
    button1.titleEdgeInsets=insets;
    [button1 setBackgroundImage:[UIImage imageNamed:@"classroom"] forState:UIControlStateNormal];
    
    [button1 addTarget:self action:@selector(classQuery) forControlEvents:UIControlEventTouchUpInside];
    button1.tintColor=[UIColor whiteColor];
    
    
    button2=[UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"环湖跑查询" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(runningQuery) forControlEvents:UIControlEventTouchUpInside];
    button2.titleEdgeInsets=insets;
    button2.tintColor=[UIColor whiteColor];
    [button2 setBackgroundImage:[UIImage imageNamed:@"query_circle"] forState:UIControlStateNormal];
    
    
    
    button3=[UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"聚会" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(timeQuery) forControlEvents:UIControlEventTouchUpInside];
    button3.titleEdgeInsets=insets;
    button3.tintColor=[UIColor whiteColor];
    [button3 setBackgroundImage:[UIImage imageNamed:@"candl"] forState:UIControlStateNormal];
    
    
    button4=[UIButton buttonWithType:UIButtonTypeSystem];
    [button4 setTitle:@"小社区" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(commnityQuery) forControlEvents:UIControlEventTouchUpInside];
    button4.titleEdgeInsets=insets;
    button4.tintColor=[UIColor whiteColor];
    [button4 setBackgroundImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    
    
    button5=[UIButton buttonWithType:UIButtonTypeSystem];
    [button5 setTitle:@"图书查询" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(bookResearch) forControlEvents:UIControlEventTouchUpInside];
    button5.titleEdgeInsets=insets;
    button5.tintColor=[UIColor whiteColor];
    [button5 setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
    
    button6=[UIButton buttonWithType:UIButtonTypeSystem];
    [button6 setTitle:@"-_-!退下" forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    button6.tintColor=[Utils colorWithHexString:@"#838f9f"];
    button6.backgroundColor=[Utils colorWithHexString:@"#3d4e62"];
    
    button7 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button7 setTitle:@"我的好友" forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(friendList) forControlEvents:UIControlEventTouchUpInside];
    button7.titleEdgeInsets = insets;
    button7.tintColor = [UIColor whiteColor];
    [button7 setBackgroundImage:[UIImage imageNamed:@"evaluation_add"] forState:UIControlStateNormal];
    
    
    
    UIBarButtonItem*bar=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem*left=[[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    self.navigationItem.leftBarButtonItem=left;
    
    
    [self.navigationItem setBackBarButtonItem:bar];
    
    
    self.popView=[[UIView alloc] initWithFrame:self.view.bounds];
    UITapGestureRecognizer*gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
    [_popView addGestureRecognizer:gesture];
    _popView.backgroundColor=[Utils colorWithHexString:@"#47566d"];
    [self buildPoint];
    
    [self.view addSubview:_tableView];

    

    

    
    
}

-(void)buildPoint{
    CGFloat margn=60;
    CGFloat widthUnit=self.view.bounds.size.width/4;
    CGFloat heightHigh=self.view.bounds.size.height/2-margn;
    CGFloat high=self.view.bounds.size.height;
    NSLog(@"%f",high);
    centerLow[1]=CGPointMake(widthUnit, high);
    centerLow[2]=CGPointMake(widthUnit*2, high);
    centerLow[3]=CGPointMake(widthUnit*3, high);
    centerLow[4]=CGPointMake(widthUnit, high+margn);
    centerLow[5]=CGPointMake(widthUnit*2, high+margn);
    centerLow[6]=CGPointMake(widthUnit*2, high+10);
    centerLow[7]=CGPointMake(widthUnit*3, high+margn);

    
    centerMenu[1]=CGPointMake(widthUnit, heightHigh);
    centerMenu[2]=CGPointMake(widthUnit*2, heightHigh);
    centerMenu[3]=CGPointMake(widthUnit*3, heightHigh);
    centerMenu[4]=CGPointMake(widthUnit, heightHigh+margn+40);
    centerMenu[5]=CGPointMake(widthUnit*2, heightHigh+margn+40);
    centerMenu[6]=CGPointMake(widthUnit*2, high-20);
    centerMenu[7]=CGPointMake(widthUnit*3, heightHigh+margn+40);

    
    
    centerHigh[1]=CGPointMake(widthUnit, -margn);
    centerHigh[2]=CGPointMake(widthUnit*2, -margn);
    centerHigh[3]=CGPointMake(widthUnit*3, -margn);
    centerHigh[4]=CGPointMake(widthUnit, -60);
    centerHigh[5]=CGPointMake(widthUnit*2, -60);
    centerHigh[7]=CGPointMake(widthUnit*3, -60);

    button2.frame=CGRectMake(0, 0, 75, 75);
    button1.frame=CGRectMake(0, 0, 75, 75);
    button3.frame=CGRectMake(0, 0, 75, 75);
    button4.frame=CGRectMake(0, 0, 75, 75);
    button5.frame=CGRectMake(0, 0, 75, 75);
    button7.frame=CGRectMake(0, 0, 75, 75);
    button6.frame=CGRectMake(0, 0, self.view.bounds.size.width, 40);

    
    [_popView addSubview:button1];
    [_popView addSubview:button2];
    [_popView addSubview:button3];
    [_popView addSubview:button4];
    [_popView addSubview:button5];
    [_popView addSubview:button6];
    [_popView addSubview:button7];
    
    
}

-(void)pop{
    
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button6.center=centerLow[6];
    } completion:^(BOOL finished) {
        button6.hidden=true;
    }];
    
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button2.center=centerHigh[2];
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button1.center=centerHigh[1];
        button3.center=centerHigh[3];
        button5.center=centerHigh[5];
    } completion:nil];
    
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button4.center=centerHigh[4];
        button7.center = centerHigh[7];
    } completion:^(BOOL finished) {
        [_popView removeFromSuperview];
        self.navigationController.navigationBarHidden=NO;
        
    }];
    
    
    
}

-(void)push{
    NSLog(@"huang");
    self.navigationController.navigationBarHidden=true;
    [self.view addSubview:_popView];
    
    button6.center=centerLow[6];
    button6.hidden=false;
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        button6.center=centerMenu[6];
    } completion:nil ];
    
    
    button2.center=centerLow[2];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button2.center=centerMenu[2];
        NSLog(@"2222");
    } completion:nil];
    
    
    button1.center=centerLow[1];
    button3.center=centerLow[3];
    button5.center=centerLow[5];
    
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1 options: UIViewAnimationOptionCurveEaseOut animations:^{
        button1.center=centerMenu[1];
        button3.center=centerMenu[3];
        button5.center=centerMenu[5];
    } completion:nil];
    
    button4.center=centerLow[4];
    button7.center = centerLow[7];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button4.center=centerMenu[4];
        button7.center =centerMenu[7];
    } completion:nil];

    
    
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.tintColor=[UIColor blueColor];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor ]}];
    

}

-(void)viewDidAppear:(BOOL)animated{




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)viewWillLayoutSubviews{
   
//    scroll.contentInset=UIEdgeInsetsMake(appHight/5, 0, 0, 0);
//    scroll.contentOffset=CGPointMake(0, -appHight/5);
//    scroll.frame=CGRectMake(0, appHight/9, appWide, appHight/9*8);
    _tableView.frame=CGRectMake(0, 0, appWide, appHight);

}

-(void)bookResearch{
    searchBookViewController*book=[[searchBookViewController alloc] init];
    [_popView removeFromSuperview];
    [self.navigationController pushViewController:book animated:YES];
    
}

-(void)classQuery{
    
    CourseListController*myclass=[[CourseListController alloc] init];
    [_popView removeFromSuperview];
    [self.navigationController pushViewController:myclass animated:YES];
    
}

-(void)runningQuery{
    runningResearchViewController*runController=[[runningResearchViewController alloc] init];
    [self.navigationController pushViewController:runController animated:YES];
    
}

-(void)timeQuery{
    [_popView removeFromSuperview];

    [self.navigationController pushViewController:[[timeViewController alloc] init] animated:YES];
    
}

-(void)commnityQuery{
    DemoVC9*demo=[DemoVC9  new];
    demo.title=@"小社区";
    [_popView removeFromSuperview];
    [self.navigationController pushViewController:demo animated:YES];
    
}

-(void)friendList{
    
    FriendListViewController*FriendView=[[FriendListViewController alloc] init];
    [_popView removeFromSuperview];
    [self.navigationController pushViewController:FriendView animated:YES];

    
}

-(void)viewDidLayoutSubviews {
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        
        
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0, 0, 0)];
        
    }
    
}

@end
