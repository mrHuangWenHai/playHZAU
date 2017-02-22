//
//  introduceModel.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/8.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "introduceModel.h"

@implementation introduceModel
-(instancetype)init{
    if(self=[super init])
    {
        self.introduce=[NSString stringWithFormat:@"参考消息网4月8日报道 西媒称，2011年美国加利福尼亚大学伯克利分校的科学家在后发座星系发现了一个前所未有的、令人震惊的超级大黑洞。它的质量相当于210亿个太阳，被载入吉尼斯纪录大全。现在同一研究团队又发现了一个大黑洞，比上一个略小一些，但同样大到不可思议：它的质量相当于170亿个太阳。它位于距离地球2亿光年的NGC1600星系中，这个星系在天空中的位置与后发座星系相对，所在区域相对空旷。据西班牙《阿贝赛报》网站4月6日报道，科学家认为，在意想不到的天空区域中发现第二大黑洞"];
        self.imageArray=[NSMutableArray array];
        
    }
    return self;
}


@end
