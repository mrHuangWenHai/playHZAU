//
//  buildActivityHeadView.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/25.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol textEdit
-(void)textFieldBeginEdit;
-(void)textFieldEndEdit;
-(void)textViewBeginEdit;
-(void)textViewEndEdit;
-(void)selectPhoto;
@end
@interface buildActivityHeadView : UIView<UITextViewDelegate>
@property(nonatomic,weak)id<textEdit>delegate;
@property(nonatomic,strong)UIImageView*imageView;
@property(nonatomic,strong)UILabel*label;


@end
