//
//  UIImage+UIImage_Extension_h.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/8.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "UIImage+UIImage_Extension_h.h"

@implementation UIImage (UIImage_Extension_h)
+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 使用颜色填充上下文
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    // 渲染图形上下文
    CGContextFillRect(context, rect);
    
    // 获取上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
