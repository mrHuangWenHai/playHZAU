//
//  insertCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/27.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "insertCell.h"
#import "Utils.h"
@interface insertCell(){
    UIButton*iphone;
    UIButton*name;
    UIButton*idcard;
    UIButton*sex;
    UIButton*age;
    UIButton*address;
    BOOL buttonBool[7];
}
@end

@implementation insertCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setup];
    }
    
    return self;
}

-(void)setup{
    iphone=[[UIButton alloc]init];
    name=[[UIButton alloc] init];
    idcard=[[UIButton alloc] init];
    sex=[[UIButton alloc] init];
    age=[[UIButton alloc] init];
    address=[[UIButton alloc] init];
    iphone.tag=1;
    name.tag=2;
    idcard.tag=3;
    sex.tag=4;
    age.tag=5;
    address.tag=6;
    [iphone setTitle:@"手机号码" forState:UIControlStateNormal];
    [name setTitle:@"姓名" forState:UIControlStateNormal];
    [idcard setTitle:@"身份证" forState:UIControlStateNormal];
    [sex setTitle:@"性别" forState:UIControlStateNormal];
    [age setTitle:@"年龄" forState:UIControlStateNormal];
    [address setTitle:@"地址" forState:UIControlStateNormal];
    
    iphone.backgroundColor=[Utils colorWithHexString:@"c7c7cc"];
    name.backgroundColor= [Utils colorWithHexString:@"c7c7cc"];
    idcard.backgroundColor=[Utils colorWithHexString:@"c7c7cc"];
    sex.backgroundColor=[Utils colorWithHexString:@"c7c7cc"];
    age.backgroundColor=[Utils colorWithHexString:@"c7c7cc"];
    address.backgroundColor=[Utils colorWithHexString:@"c7c7cc"];    
    iphone.layer.cornerRadius=5;
    iphone.layer.masksToBounds=YES;
    
    name.layer.cornerRadius=5;
    name.layer.masksToBounds=YES;
    
    idcard.layer.cornerRadius=5;
    idcard.layer.masksToBounds=YES;
    
    sex.layer.cornerRadius=5;
    sex.layer.masksToBounds=YES;
    
    age.layer.cornerRadius=5;
    age.layer.masksToBounds=YES;
    
    address.layer.cornerRadius=5;
    address.layer.masksToBounds=YES;
   
    [iphone addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];
    [name addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];
    [idcard addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];
    [sex addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];
    [age addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];
    [address addTarget:self action:@selector(bu1:) forControlEvents:UIControlEventTouchUpInside];





    
    [self.contentView addSubview:iphone];
    [self.contentView addSubview:name];
    [self.contentView addSubview:idcard];
    [self.contentView addSubview:sex];
    [self.contentView addSubview:age];
    [self.contentView addSubview:address];
}

-(void)bu1:(UIButton*)button{
    if(!buttonBool[button.tag])
    {
        button.backgroundColor=[UIColor blueColor];
        buttonBool[button.tag]=!buttonBool[button.tag];
    }
    else
    {
        button.backgroundColor=[UIColor grayColor];
        buttonBool[button.tag]=!buttonBool[button.tag];
    }
    
}


-(void)layoutSubviews{
    CGFloat width=CGRectGetWidth(self.bounds);
    CGFloat high=CGRectGetHeight(self.bounds);
    iphone.frame=CGRectMake(10, 10, width/4, high/3);
    name.frame=CGRectMake(10+width/4+25, 10,width/4-30 , high/3);
    idcard.frame=CGRectMake(width/2+25, 10, width/4-3, high/3);
    sex.frame=CGRectMake(10, 10+high/3+10, width/4-30, high/3);
    age.frame=CGRectMake(width/4, high/3+20, width/4-30, high/3);
    address.frame=CGRectMake(width/2-10, high/3+20, width/4-30, high/3);
}

@end
