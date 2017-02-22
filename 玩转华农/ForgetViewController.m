//
//  ForgetViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ForgetViewController.h"
#import "Utils.h"
#import "httpTool.h"
#import "MBProgressHUD+Add.h"

@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _finshButtom.backgroundColor=[Utils colorWithHexString:@"#f17a5d"];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)finsh:(id)sender {
    MBProgressHUD*hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.labelText=@"账号或者密码错误";
    [hud hide:NO];

    if([_firstPassword.text isEqualToString:@""]){
        hud.labelText=@"密码不能为空";
        [hud show:true];
        [hud hide:true afterDelay:1];
        return;
    }
    
    if(![_firstPassword.text isEqualToString:_secondPassword.text]){
        hud.labelText=@"两次输入的密码有错误";
        [hud show:true];
        [hud hide:true afterDelay:1];
        return;
    }
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    dic[@"func"]=@"forgetPassword";
    dic[@"name"]=_accountName.text;
    dic[@"password"]=_firstPassword.text;
    [httpTool forgetPassWordWith:dic complete:^(NSDictionary *dic) {
        if([dic[@"success"] isEqualToString:@"1"]){
            _finsh();
        }
        else{
            [hud show:true];
            [hud hide:true afterDelay:1];
        }
    }];
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
