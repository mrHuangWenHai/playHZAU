//
//  FriendGroup.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"
#import "EMSDK.h"


@implementation FriendGroup

-(instancetype)init{
    if(self = [super init]){
        self.friendGroup = [NSMutableDictionary dictionary];
        
        
        
    }
    return self;
}

- (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

-(void)loadData:(void(^)())finsh{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __weak typeof(self)weak =self;
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group,queue , ^{
        EMError *error = nil;
        NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
        if (!error) {
            NSString*name;
            NSString*head;
            for(int i=0;i<userlist.count;i++)
            {
                name = userlist[i];
                head=[weak firstCharactor:name];
                NSLog(@"%@",name);
                Friend*friend = [[Friend alloc] init];
                friend.name = name;
                friend.headImageUrl = @"chat";
                friend._noread_number = @"2";
                friend.time = @"PM 03:00";
                friend.message = @"哈哈";
                if(_friendGroup[head] == nil)
                {
                    NSMutableArray*array = [NSMutableArray array];
                    [array addObject:friend];
                    _friendGroup[head] = array;
                }
                else
                {
                    NSMutableArray*array = _friendGroup[head];
                    [array addObject:friend];
                }
            }
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        finsh();
    });
}


@end
