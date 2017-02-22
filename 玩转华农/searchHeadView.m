//
//  searchHeadView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/8.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "searchHeadView.h"
#import "head.h"
#import "Utils.h"
@interface searchHeadView(){
    
}
@property(strong,nonatomic)UIImageView*imageView;
@end
@implementation searchHeadView



-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    self.imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon4"]];
    [self addSubview:_imageView];
    UILabel*label=[UILabel new];
    label.text=@"活动未开始";
    label.textColor=[UIColor grayColor];
    [self addSubview:label];
    UIImageView*qizi=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qizi"]];
    [self addSubview:qizi];
    UILabel*name=[UILabel new];
    name.text=@"遇见青春：话剧《左耳》演员见面会";
    name.textAlignment=NSTextAlignmentCenter;
    [self addSubview:name];
    
    UIButton*button=[[UIButton alloc] init];
    [button setTitle:@"精彩活动秀" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(activity) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:button];
    
    button.layer.borderWidth=1;
    button.layer.borderColor=[UIColor orangeColor].CGColor;
    
    UIView*view=[UIView new];
    view.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [self addSubview:view];
    
    
    _imageView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(150);
    
    qizi.sd_layout
    .topSpaceToView(_imageView,5)
    .leftSpaceToView(self,5)
    .widthIs(25)
    .heightIs(25);
    
    label.sd_layout
    .leftSpaceToView(qizi,5)
    .topSpaceToView(_imageView,5)
    .rightEqualToView(self)
    .heightIs(25);
    
    name.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(label,5)
    .rightEqualToView(self)
    .heightIs(25);
    
    button.sd_layout
    .topSpaceToView(name,10)
    .leftSpaceToView(self,appWide*0.28)
    .rightSpaceToView(self,appWide*0.28)
    .heightIs(35);
    
    view.sd_layout
    .topSpaceToView(button,20)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(10);
    
    
    
    
    
    
}

-(void)activity{
    
}


@end
