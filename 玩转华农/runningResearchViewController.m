//
//  runningResearchViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/2/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "runningResearchViewController.h"
#import "head.h"
#import "Utils.h"
#import "httpTool.h"

@implementation runningResearchViewController{
    UILabel*runningLabel;
    UIButton*submit;
    UITextField*account;
    UITextField*passage;
    
    
}
-(instancetype)init{
    self.title=@"环湖跑查询";
    return [super init];
}

-(void)viewDidLoad{
    self.navigationController.navigationBarHidden=NO;

    self.view.backgroundColor=[UIColor whiteColor];
    runningLabel=[[UILabel alloc] init];
    runningLabel.layer.borderWidth=0;
    runningLabel.backgroundColor=[Utils colorWithHexString:@"#f0f0f4"];
    runningLabel.textAlignment=NSTextAlignmentCenter;
    runningLabel.textColor=[UIColor redColor];
    runningLabel.font=[UIFont systemFontOfSize:50];
    [self.view addSubview:runningLabel];
    
     submit=[UIButton buttonWithType:UIButtonTypeSystem];
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    submit.backgroundColor=[Utils colorWithHexString:@"#f17a5d"];
    [submit addTarget:self action:@selector(query) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    
    account=[[UITextField alloc] init];
    account.placeholder=@"请输入账号";
    account.textAlignment=NSTextAlignmentCenter;
    account.clearButtonMode=UITextFieldViewModeWhileEditing;
    [account setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:account];
    
    passage=[[UITextField alloc] init];
    passage.textAlignment=NSTextAlignmentCenter;
    passage.clearButtonMode=UITextFieldViewModeWhileEditing;
    passage.text=@"888888";
    [passage setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:passage];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    [self.view addGestureRecognizer:tap];
    CATransition*anmation1=[CATransition animation];
    anmation1.type=kCATransitionMoveIn;
    anmation1.subtype=kCATransitionFromLeft;
    anmation1.duration=2;
    [passage.layer addAnimation:anmation1 forKey:nil];
    [account.layer addAnimation:anmation1 forKey:nil];
    
    CATransition*animation2=[CATransition animation];
    animation2.type=kCATransitionReveal;
    animation2.subtype=kCATransitionFromLeft;
    animation2.duration=2;
    [runningLabel.layer addAnimation:animation2 forKey:nil];

    
}

-(void)resign{
    [account resignFirstResponder];
    [passage resignFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"runsearch"]){
        account.text=[defaults objectForKey:@"runsearch"];
    }

}

-(void)query{
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    if([account.text isEqualToString:@""]){
        return;
    }
    [defaults setObject:account.text forKey:@"runsearch"];
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    dic[@"func"]=@"runsearch";
    dic[@"id"]=account.text;
    dic[@"ps"]=passage.text;
    [httpTool queryRunningNumber:dic complete:^(NSDictionary *dic) {
        runningLabel.text=dic[@"num"];
    }];
}

-(void)viewWillLayoutSubviews{
    runningLabel.frame=CGRectMake(appWide/2-appWide/8,appHight/6 , appWide/4, appWide/4);
   runningLabel.layer.cornerRadius=appWide/8;
   runningLabel.layer.masksToBounds=true;
    account.frame=CGRectMake(appWide/8-30, appHight/3+30, appWide-30, appHight/11);
    passage.frame=CGRectMake(appWide/8-30, appHight/2, appWide-30, appHight/11);
    submit.frame=CGRectMake(20, appHight/2*1.3, appWide-40, 40);
    
    
}

@end
