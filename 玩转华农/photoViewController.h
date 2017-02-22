//
//  photoViewController.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/31.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"
typedef void (^Block)(UIImage*image);
@interface photoViewController : ViewController
@property(nonatomic,copy)NSString*typePhoto;
@property(nonatomic,copy)Block myblock;

@end
