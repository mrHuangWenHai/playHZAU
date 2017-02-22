//
//  newsTableViewCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "newsTableViewCell.h"

@implementation newsTableViewCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        NSLog(@"aaaaaaaaaaaaaaa");
//    }
//    return self;
//}


-(void)setModel:(news*)model{
    _model=model;
    self.title.text=_model.title;
    self.detail.text=_model.detail;
    if(self.title==nil){
        NSLog(@"te");
    }
    self.imageHead.image=[UIImage imageNamed:@"icon0"];
}

@end
