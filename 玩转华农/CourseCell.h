//
//  CourseCell.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/27.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"

@interface CourseCell : UICollectionViewCell
@property(nonatomic,strong)UILabel*course;
@property(nonatomic,strong)CourseModel*model;
@end
