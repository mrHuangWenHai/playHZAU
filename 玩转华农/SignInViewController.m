//
//  SignInViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "SignInViewController.h"
#import "Utils.h"
#import "RegisterViewController.h"
#import "ViewController.h"
#import "httpTool.h"
#import "MBProgressHUD+Add.h"

@interface SignInViewController (){
    UITextField*accountName;
    UITextField*passWord;
    UIButton*button;
    UIButton*registerButton;
    UIButton*forgetPasswordButton;
    CAKeyframeAnimation*animation;
    UIImageView*headImage;

}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer*shad=[CAGradientLayer layer];
    shad.colors=@[(id)[Utils colorWithHexString:@"#6f83bf"].CGColor,(id)[Utils colorWithHexString:@"#e9c490"].CGColor];
    shad.frame=self.view.bounds;
    
    [self.view.layer addSublayer:shad];
    
    [self setUp];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
    self.navigationItem.leftBarButtonItem=nil;
    
    
    
}


-(void)createAnimation{
    CGFloat x=accountName.layer.position.x;
    animation=[CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    animation.values=@[[NSNumber numberWithFloat:x-3],[NSNumber numberWithFloat:x],[NSNumber numberWithFloat:x+3],[NSNumber numberWithFloat:x]];
    animation.repeatCount=5;
    animation.duration=0.2;
}

-(void)setUp{
    accountName=[[UITextField alloc] init];
    accountName.placeholder=@"请输入用户名";
    accountName.backgroundColor=[UIColor whiteColor];
    accountName.layer.cornerRadius=5;
    accountName.layer.masksToBounds=true;
    accountName.leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    accountName.leftViewMode=UITextFieldViewModeAlways;
    
    passWord=[[UITextField alloc] init];
    passWord.placeholder=@"请输入密码";
    passWord.secureTextEntry=YES;
    passWord.layer.cornerRadius=5;
    passWord.layer.masksToBounds=YES;
    passWord.backgroundColor=[UIColor whiteColor];
    passWord.leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    passWord.leftViewMode=UITextFieldViewModeAlways;
    
    button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor=[Utils colorWithHexString:@"#d9bb97"];
    button.layer.cornerRadius=5;
    button.layer.masksToBounds=true;
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(logi) forControlEvents:UIControlEventTouchUpInside];
    
    registerButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [registerButton setTintColor:[UIColor whiteColor]];
    [registerButton setTitle:@"账号注册?" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButton) forControlEvents:UIControlEventTouchUpInside];
    
    forgetPasswordButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [forgetPasswordButton setTintColor:[UIColor whiteColor]];
    [forgetPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPasswordButton addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    
    headImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3.jpg"]];
    headImage.frame=CGRectMake(0, 0, 100, 100);
    headImage.layer.cornerRadius=50;
    headImage.layer.masksToBounds=true;
    
    [self.view addSubview:headImage];
    [self.view addSubview:forgetPasswordButton];
    [self.view addSubview:registerButton];
    [self.view addSubview:button];
    [self.view addSubview:accountName];
    [self.view addSubview:passWord];
    
    
}

-(void)logi{
    if(accountName.text.length==0){
        [accountName.layer addAnimation:animation forKey:nil];
        return;
    }
    else{
        if(passWord.text.length==0){
            [passWord.layer addAnimation:animation forKey:nil];
            return;
        }
    }
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    dic[@"func"]=@"sign";
    dic[@"name"]=accountName.text;
    dic[@"password"]=passWord.text;
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:accountName.text forKey:@"accountName"];
    
    __block MBProgressHUD*hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.labelText=@"账号或者密码错误";
    [hud hide:NO];

    __weak typeof(self)weakself=self;
    [httpTool loginWithParamet:dic complete:^(NSDictionary *dic) {
        if([dic[@"success"] isEqualToString:@"1"]){
            UINavigationController*na=[[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
            NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
            [defaults setObject:accountName.text forKey:@"name"];
            [defaults setObject:passWord.text forKey:@"password"];
            [weakself presentViewController:na animated:YES completion:nil];
        }
        else{
            [hud show:YES];
            [hud performSelector:@selector(hide:) withObject:nil afterDelay:1];
        }
    }];
    
    
}

-(void)registerButton{
    RegisterViewController*registe=[[RegisterViewController alloc] init];
    registe.title=@"注册";
    registe.registOrForget=NO;
    UINavigationController*navi=[[UINavigationController alloc] initWithRootViewController:registe];
    [self presentViewController:navi animated:YES completion:nil];
}

-(void)tap{
    [self.view endEditing:YES];
}

-(void)viewWillLayoutSubviews{
    CGFloat appwidth=CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat apphight=CGRectGetHeight([UIScreen mainScreen].bounds);
    accountName.frame=CGRectMake(appwidth*0.1,apphight*0.3, appwidth*0.8, 45);
    passWord.frame=CGRectMake(appwidth*0.1, apphight*0.4, appwidth*0.8, 45);
    button.frame=CGRectMake(appwidth*0.1, apphight*0.5, appwidth*0.8, 45);
    registerButton.frame=CGRectMake(appwidth*0.1,apphight*0.9, 70, 40);
    forgetPasswordButton.frame=CGRectMake(appwidth*0.8-40, apphight*0.9, 70, 40);
    headImage.frame=CGRectMake(appwidth*0.35, apphight*0.1, 100, 100);
    
    [self createAnimation];
    
}

-(void)forget{
    RegisterViewController*registe=[[RegisterViewController alloc] init];
    registe.title=@"重置";
    registe.registOrForget=true;
    UINavigationController*navi=[[UINavigationController alloc] initWithRootViewController:registe];
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
