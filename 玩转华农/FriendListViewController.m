//
//  FriendListViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "FriendListViewController.h"
#import "head.h"
#import "Utils.h"
#import "EMSDK.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "chatViewController.h"
#import "MessageViewCell.h"

@interface FriendListViewController()<UITableViewDelegate,UITableViewDataSource>{
    UITableView*friendTableView;
    NSArray*friendFristName;

    
}
@property(nonatomic,strong)FriendGroup*group;
@end

@implementation FriendListViewController

-(instancetype)init{
    if( [super init]){
        self.title = @"我的好友";
        friendFristName = [NSMutableArray array];
    }
    return self;
}

-(void)viewDidLoad{
    
    self.navigationController.navigationBarHidden=NO;

    UISearchBar*search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, appWide, 40)];
    search.barTintColor = [Utils colorWithHexString:@"#eeeeee"];
    
    friendTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWide, appHight) style:UITableViewStyleGrouped];
    friendTableView.tableHeaderView = search;
    friendTableView.tableFooterView = [[UIView alloc] init];
    friendTableView.dataSource=self;
    friendTableView.delegate = self ;
    [friendTableView  registerClass:[MessageViewCell class] forCellReuseIdentifier:@"cell"];
    
    
   NSLog(@"%@", [EMClient sharedClient].currentUsername);
    
    [self.view addSubview:friendTableView];
    [self dataInit];
    
    

    
}

-(void)dataInit{
    self.group = [[FriendGroup alloc] init];
    [_group loadData:^() {
        friendFristName = [_group.friendGroup allKeys];
        NSLog(@"%@",_group.friendGroup);
        NSLog(@"%@",friendFristName);
        [friendTableView reloadData];
        
    }];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[Utils colorWithHexString:@"#2fb791"]];

    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return friendFristName.count+1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0) return 1;
    else
    {
        NSArray*number = [_group.friendGroup objectForKey:friendFristName[section-1]];
        return number.count;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend*friend;
    MessageViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.section == 0){
        cell.name.text = @"新的朋友";
        cell.headImage.image = [UIImage imageNamed:@"add"];
    }
    else
    {
        NSArray*myFriend = [_group.friendGroup objectForKey:friendFristName[indexPath.section-1]];
        friend = myFriend[indexPath.row];
        NSLog(@"%@",myFriend);
//        cell.textLabel.text = friend.name;
//        cell.imageView.image = [UIImage imageNamed:friend.headImageUrl];
        [cell loadModel:friend];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) return;
    NSArray*myFriend = [_group.friendGroup objectForKey:friendFristName[indexPath.section-1]];
    Friend*friend = myFriend[indexPath.row];
    chatViewController*chat = [[chatViewController alloc] initWithConversationChatter:friend.name conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chat animated:true]
    ;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0) return @"";
    else
        return friendFristName[section-1];
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return friendFristName;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0) return 0;
    else return 20;
}


@end
