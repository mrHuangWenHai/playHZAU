//
//  FinshRegisterViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "FinshRegisterViewController.h"
#import "Utils.h"
#import "ZLPhotoActionSheet.h"
#import "ClipsHeadImageViewController.h"
#import "httpTool.h"
#import "MBProgressHUD+Add.h"

@interface FinshRegisterViewController ()<UITextFieldDelegate>{
    ZLPhotoActionSheet*actionSheet;
}
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation FinshRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"完成注册";
    self.login.backgroundColor=[Utils colorWithHexString:@"#c7c7cc"];
    self.view.userInteractionEnabled=true;
    _login.userInteractionEnabled=true;
    _showButton.userInteractionEnabled=true;
    _passWord.secureTextEntry=false;
    _login.layer.cornerRadius=5;
    _login.layer.masksToBounds=true;
    
    _passWord.delegate=self;
    _name.delegate=self;
    
    _headImageView.layer.cornerRadius=_headImageView.bounds.size.width/2;
    _headImageView.layer.masksToBounds=true;
    _headImageView.userInteractionEnabled=true;
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
    UITapGestureRecognizer*tapImage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage)];
    [_headImageView addGestureRecognizer:tapImage];
    
    UIBarButtonItem*left=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=left;
    
    actionSheet=[[ZLPhotoActionSheet alloc] init];
    actionSheet.maxSelectCount=1;
    actionSheet.maxPreviewCount=0;
    // Do any additional setup after loading the view from its nib.
}

-(void)changeImage{
    __weak typeof(self) weakSelf=self;
     ClipsHeadImageViewController*head=[[ClipsHeadImageViewController alloc]init];
    head.imageView=[[UIImageView alloc] init];
    head.finshImage=^(UIImage*image){
        _headImageView.image=image;
        _label.hidden=true;
    };
    [actionSheet showWithSender:self animate:true completion:^(NSArray<UIImage *> * _Nonnull selectPhotos) {
        head.imageView.image=selectPhotos[0];
        [weakSelf presentViewController:head animated:true completion:nil];
    }];
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)tap{
    [self.view endEditing:true];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if(_passWord.text.length>0&&_name.text.length>0)
        _login.backgroundColor=[Utils colorWithHexString:@"#f17a5d"];
    else
        _login.backgroundColor=[Utils colorWithHexString:@"#c7c7cc"];
    
    return true;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rect=self.view.bounds;
        rect.origin.y-=100;
        self.view.bounds=rect;
    }];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rect=self.view.bounds;
        rect.origin.y+=100;
        self.view.bounds=rect;
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    NSArray*array=self.view.subviews;
    for(id vi in array){
        if([vi isKindOfClass:[UIScrollView class]]){
            [(UIScrollView*)vi removeFromSuperview];
        }
    }
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

- (IBAction)finshLogin:(id)sender {
    NSMutableDictionary*parms=[NSMutableDictionary dictionary];
    parms[@"func"]=@"savedata";
    parms[@"name"]=_name.text;
    parms[@"password"]=_passWord.text;
    
    __weak typeof(self)weakself=self;
    [httpTool SaveAccountAndPassWordWithParamet:parms complete:^(NSDictionary *dic) {
        if([dic[@"success"]isEqualToString:@"1"]){
            NSLog(@"成功了");
            [weakself.navigationController popToRootViewControllerAnimated:false];
            [_delegate popToSign];
        }
        else{
            NSLog(@"%@",dic[@"error"]);
        }
    }];
    
}

- (IBAction)showPassWord:(id)sender {
    if(self.passWord.secureTextEntry==false){
        _passWord.secureTextEntry=true;
        [_showButton setBackgroundImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateNormal];
    }
    else{
        _passWord.secureTextEntry=false;
        [_showButton setBackgroundImage:[UIImage imageNamed:@"btn_unselected"] forState:UIControlStateNormal];
    }
}
@end
