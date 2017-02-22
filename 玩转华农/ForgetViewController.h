//
//  ForgetViewController.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finshBlock)() ;
@interface ForgetViewController : UIViewController
@property(nonatomic,copy)finshBlock finsh;
@property (strong, nonatomic) IBOutlet UIButton *finshButtom;
@property (strong, nonatomic) IBOutlet UITextField *accountName;
@property (strong, nonatomic) IBOutlet UITextField *firstPassword;
@property (strong, nonatomic) IBOutlet UITextField *secondPassword;

@end
