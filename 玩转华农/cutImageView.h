//
//  cutImageView.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/31.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol photoImage
-(void)finshImage:(UIImage*)image;

@end

@interface cutImageView : UIView

-(void)setUpImage:(UIImage*)image;

@property(nonatomic,weak)id<photoImage>delegate;
@end
