//
//  buildActivityHeadView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/25.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "buildActivityHeadView.h"
#import "UIView+SDAutoLayout.h"
#import "Utils.h"
#import "myToolBar.h"
@interface buildActivityHeadView(){
    UITextField*textField;
    UITextView*textView;
    
    
    
}
@end
@implementation buildActivityHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

-(void)setup{
    CGFloat width=CGRectGetWidth(self.frame);
    CGFloat hight=CGRectGetHeight(self.frame);
    
   self.label=[[UILabel alloc] init];
    _label.text=@"添加封面图片";
    
    self.imageView=[[UIImageView alloc] init];
    _imageView.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [self addSubview:_imageView];
    textField=[UITextField new];
    textField.placeholder=@"输入活动的名称";
    textField.leftView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qizi"]];
    textField.leftViewMode=UITextFieldViewModeAlways;
    textField.font=[UIFont systemFontOfSize:12];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.textColor=[UIColor grayColor];
    textField.tag=1;
    textField.delegate=self;
    [self addSubview:textField];
    
    
    textView=[UITextView new];
    textView.delegate=self;
    textView.text=@"  填写活动描述，让更多的人参与活动";
    textView.textColor=[UIColor grayColor];
    textView.tag=2;
    [self addSubview:textView];
    _imageView.frame=CGRectMake(0, -64, width, hight/3+33.5);
    textField.frame=CGRectMake(0, hight/3-30, width, 50);
    textView.frame=CGRectMake(0, hight/3+20, width, hight/3*2-20);
    
    _label.frame=CGRectMake(width/2-35, (hight/3-30)/2+70,100, 25);
    _label.font=[UIFont systemFontOfSize:12];
    _label.textColor=[UIColor grayColor];
    [_imageView addSubview:_label];
    
    
    myToolBar*topView=[[myToolBar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    UIBarButtonItem*btnSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem*doneButton=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    topView.backgroundColor=[Utils colorWithHexString:@"#f2f2f2"];
    [topView setItems:@[btnSpace,doneButton]];
    [textView setInputAccessoryView:topView];
    [textField setInputAccessoryView:topView];
    
    _imageView.userInteractionEnabled=YES;
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [_imageView addGestureRecognizer:tap];
    
}

-(void)tap{
    [_delegate selectPhoto];
}

-(void)dismissKeyBoard{
    [self endEditing:YES];
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
        [_delegate textViewBeginEdit];
    NSLog(@"adf");
    
    
    textView.text=nil;
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if([textView.text length]==0)
    {
        textView.text=@"填写活动描述，让更多的人参与活动";
    }
    [self.delegate textViewEndEdit];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self.delegate textFieldBeginEdit];
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self.delegate textFieldEndEdit];
}



@end
