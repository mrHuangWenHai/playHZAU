//
//  RegisterViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "RegisterViewController.h"
#import "Utils.h"
#import "head.h"
#import "UIImageView+WebCache.h"
#import "FinshRegisterViewController.h"
#import "httpTool.h"
#import "MBProgressHUD.h"
#import "ForgetViewController.h"

@interface RegisterViewController (){
    UITextField*teachAccount;
    UITextField*teachPassWord;
    UIButton*next;
    UITextField*verification;
    UIImageView*imageView;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIBarButtonItem*leftButton=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem=leftButton;
    
    [self setUp];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

-(void)tap{
    [self.view endEditing:true];
}

-(void)setUp{
    teachAccount=[[UITextField alloc] init];
    teachAccount.placeholder=@"请输入您的学号";
    teachAccount.borderStyle=UITextBorderStyleRoundedRect;
    teachAccount.keyboardType=UIKeyboardTypeNumberPad;
    
    teachPassWord=[[UITextField alloc] init];
    teachPassWord.placeholder=@"请输入您的教务处密码";
    teachPassWord.borderStyle=UITextBorderStyleRoundedRect;
    
    next=[[UIButton alloc] init];
    next.backgroundColor=[Utils colorWithHexString:@"#f17a5d"];
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    next.layer.cornerRadius=5;
    next.layer.masksToBounds=true;
    
    verification=[[UITextField alloc] init];
    verification.placeholder=@"请输入验证码";
    verification.borderStyle=UITextBorderStyleRoundedRect;
    
    imageView=[[UIImageView alloc] init];
    
    
    NSString*url=@"http://jw.hzau.edu.cn/CheckCode.aspx";
    NSMutableURLRequest*request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setValue:@"ASP.NET_SessionId=djod3a55mfalefjwmqcodfrl" forHTTPHeaderField:@"Cookie"];
    NSData*data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    imageView.image=[UIImage imageWithData:data];
    
    
    
    
    [self.view addSubview:teachAccount];
    [self.view addSubview:teachPassWord];
    [self.view addSubview:next];
    [self.view addSubview:verification];
    [self.view addSubview:imageView];
    
    
}

-(void)push{
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    teachAccount.text=@"2014317200120";
    teachPassWord.text=@"HUANGwenhai520";
    dic[@"func"]=@"register";
    dic[@"num"]=teachAccount.text;
    dic[@"pas"]=teachPassWord.text;
    dic[@"checkCode"]=verification.text;
    
    __weak typeof(self)weakself=self;
    __block FinshRegisterViewController*finsh;
    
    __block ForgetViewController*forget;
    
   if(!self.registOrForget)
   {
    finsh=[[FinshRegisterViewController alloc] init];
    finsh.delegate=self;
   }
   else
   {
       forget=[[ForgetViewController alloc] init];
       forget.finsh=^(){
           [weakself dismissViewControllerAnimated:true completion:nil];
       };
   }
   
    
   __block MBProgressHUD*hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.labelText=@"成功";
    [hud hide:NO];
    
    
    [httpTool registerWith:dic succeed:^(NSDictionary *returnValue) {

        
        if ([returnValue[@"success"] isEqualToString:@"1"]) {
            NSLog(@"教务处链接成功");
            if(!_registOrForget)
            [weakself.navigationController pushViewController:finsh animated:YES];
            else
            [weakself.navigationController pushViewController:forget animated:YES];
        }
        else{
            
            hud.labelText=returnValue[@"Error"];
            [hud show:true];
            
            [hud performSelector:@selector(hide:) withObject:nil afterDelay:1];

            
            
            
            [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://jw.hzau.edu.cn/CheckCode.aspx"] placeholderImage:nil options:SDWebImageRefreshCached];
        }
        
    }];
    
}

-(void)popToSign{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)pop{
    NSLog(@"aaaaaaa");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor ]}];
    [self.navigationController.navigationBar setBarTintColor:[Utils colorWithHexString:@"#2fb791"]];
    
}

-(void)viewWillLayoutSubviews{
    
    teachAccount.frame=CGRectMake(appWide*0.1, appHight*0.225, appWide*0.8, 40);
    teachPassWord.frame=CGRectMake(appWide*0.1, appHight*0.3, appWide*0.8, 40);
    next.frame=CGRectMake(appWide*0.1, appHight*0.45, appWide*0.8, 40);
    verification.frame=CGRectMake(appWide*0.1, appHight*0.375,appWide*0.6, 40);
    imageView.frame=CGRectMake(appWide*0.72, appHight*0.375, appWide*0.25, 40);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
