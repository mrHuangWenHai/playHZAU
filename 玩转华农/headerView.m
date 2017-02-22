//
//  headerView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/26.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "headerView.h"
@interface headerView(){
    BOOL rotate;
    
}

@property(nonatomic,strong)UIButton*button;

@end

@implementation headerView
-(instancetype)headrViewWithTableView:(UITableView*)tableView{
    static NSString*ID=@"headView";
    headerView*headView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if(headView==nil)
    {
        rotate=false;
        headView=[[headerView alloc]  initWithReuseIdentifier:ID];
        headView.layer.borderColor=[UIColor colorWithRed:238/256 green:238/256 blue:239/256 alpha:0.2].CGColor;
        headView.layer.borderWidth=0.4;
    }

    return headView;
    
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier])
    {
        [self setUpCoverButton];
        
    }
    
    return self;
}

-(void)setUpCoverButton{
       self.button=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_button];
        [_button setImage:[UIImage imageNamed:@"arr"] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    _button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    _button.titleEdgeInsets=UIEdgeInsetsMake(0, 15, 0, 0);
    _button.imageView.contentMode=UIViewContentModeCenter;
    _button.imageView.clipsToBounds=NO;
    _button.backgroundColor=[UIColor whiteColor];
    [_button setTitle:@"高级选项" forState:UIControlStateNormal];
    
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    rotate=!rotate;
    [self roate];
    [self.delegate reloadThisTableView];
    [self.nextResponder touchesBegan:touches withEvent:event];

}

-(void)layoutSubviews{

    _button.imageEdgeInsets=UIEdgeInsetsMake(0, CGRectGetWidth(self.bounds)-20, 0, 0);

    _button.frame=self.bounds;//不能等于self.contentView.bounds应为其为0;
}

-(void)roate{
    if (rotate) {
    self.button.imageView.transform = CGAffineTransformRotate(_button.transform, M_PI_2);
    } else {
      _button.imageView.transform = CGAffineTransformRotate(_button.transform, 0);
    }

}



@end
