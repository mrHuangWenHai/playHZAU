//
//  ClipsHeadImageViewController.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/4/23.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinshImage)(UIImage*image);
@interface ClipsHeadImageViewController : UIViewController
@property(nonatomic,strong)UIScrollView*scrollView;
@property(nonatomic,strong)UIImageView*imageView;
@property(nonatomic,copy)FinshImage finshImage;

@end
