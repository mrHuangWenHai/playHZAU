//
//  viewBeginController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/16.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "viewBeginController.h"
#import "chatViewController.h"
#import "Utils.h"

@interface viewBeginController ()

@end

@implementation viewBeginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button.backgroundColor=[Utils colorWithHexString:@"#2eb790"];
    [self.button setTitle:@"进入讨论组" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(chat) forControlEvents:UIControlEventTouchUpInside];
}



-(void)chat{
    chatViewController*chat=[[chatViewController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChatRoom];
    [self.navigationController pushViewController:chat animated:YES];
    
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
