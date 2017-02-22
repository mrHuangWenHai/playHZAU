//
//  newsHeadTableViewCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "newsHeadTableViewCell.h"
#import "head.h"
#import "headNewsView.h"
@interface newsHeadTableViewCell(){
    headNewsView*headNews;
}
@end

@implementation newsHeadTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        headNews=[[headNewsView alloc] initWithFrame:CGRectMake(0, 0, appWide,180)];
        [self.contentView addSubview:headNews];
        [headNews startTime];
    }
    return self;
}

-(void)layoutSubviews{

}

@end
