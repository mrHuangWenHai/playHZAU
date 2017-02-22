//
//  picturlView.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/15.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDPhotoBrowser.h"

@interface picturlView : UIView<SDPhotoBrowserDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,copy)NSArray*imageArray;
@property(nonatomic,copy)NSArray*setImage;

@end
