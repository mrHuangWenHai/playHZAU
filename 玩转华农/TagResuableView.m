//
//  TagResuableView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/27.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "TagResuableView.h"

#import "TagResuableView.h"
#import "Utils.h"

@implementation TagResuableView
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.num = [[UILabel alloc] initWithFrame:self.bounds];
        _num.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_num];
        self.layer.borderWidth = 0.24;
        self.layer.borderColor = [Utils colorWithHexString:@"#6f6c69"].CGColor;
        
    }
    return self;
}
@end
