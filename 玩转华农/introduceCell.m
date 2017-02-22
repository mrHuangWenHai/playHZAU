//
//  introduceCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/8.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "introduceCell.h"
#import "head.h"
#import "UIView+SDAutoLayout.h"
#include "myLabel.h"
#include "Utils.h"
@interface introduceCell(){
    myLabel*introduce;
    UIImageView*imageView;
}
@end


@implementation introduceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setup];
    }
    
    return self;
}

-(void)setup{
    introduce=[myLabel new];
    [self.contentView addSubview:introduce];
    UIView*contentView=self.contentView;
    introduce.numberOfLines=0;
    
    UIView*view=[[UIView alloc] init];
    view.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [self.contentView addSubview:view];
    //introduce.backgroundColor=[UIColor whiteColor];
    //introduce.enabled=NO;
   // introduce.highlighted=NO;
    
    
    introduce.sd_layout
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .topEqualToView(contentView)
    .autoHeightRatio(0);
    
    imageView=[[UIImageView alloc] init];
    UIImage*image=[UIImage imageNamed:@"icon2.jpg"];
    imageView.image=image;
    CGFloat height=image.size.height/image.size.width*(appWide-10);
    [self.contentView addSubview:imageView];
    
    imageView.sd_layout
    .leftSpaceToView(contentView,5)
    .rightSpaceToView(contentView,5)
    .topSpaceToView(introduce,0)
    .heightIs(height);
    
    view.sd_layout
    .topSpaceToView(imageView,0)
    .rightEqualToView(contentView)
    .leftEqualToView(contentView)
    .heightIs(10);
    
    
}

-(void)setModel:(introduceModel *)model{
    _model=model;
    introduce.text=_model.introduce;
   
    [introduce sizeToFit];
    
    [self setupAutoHeightWithBottomView:imageView bottomMargin:15];
}

@end
