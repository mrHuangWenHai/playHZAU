//
//  FinshRegisterViewController.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"

@protocol popDelegate <NSObject>
-(void)popToSign;
@end

@interface FinshRegisterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *login;
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
- (IBAction)finshLogin:(id)sender;
- (IBAction)showPassWord:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *showButton;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property(weak,nonatomic)id<popDelegate>delegate;
@end
