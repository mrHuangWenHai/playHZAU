//
//  picturlView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/15.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "picturlView.h"
#import "UIView+SDAutoLayout.h"
#import "SDPhotoBrowser.h"

@implementation picturlView
-(instancetype)init{
    if(self=[super init])
    {
        [self setup];
        self.userInteractionEnabled=YES;
    }
    
    return self;
}

-(void)setup{
    NSMutableArray*array=[NSMutableArray array];
    
    for(int i=0;i<=9;i++)
    {
        UIImageView*image=[[UIImageView alloc] init];
        image.tag=i;
        image.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [image addGestureRecognizer:tap];

        [self addSubview:image];
        [array addObject:image];
    }
    
    
    self.setImage=array;

    
}

-(void)setImageArray:(NSArray*)imageArray{
    _imageArray=imageArray;
    
    NSLog(@"%@",_imageArray);
    
    for(NSInteger i=_imageArray.count;i<_setImage.count;i++)
    {
        UIImageView*image=_setImage[i];
        image.hidden=YES;
    }
    
    if(_imageArray.count==0)
    {
        self.height=0;
        self.fixedHeight=@(0);
        return;
        
    }
    
    CGFloat itemW=[self itemWidthForPicPathArray:_imageArray];
    CGFloat itemH=0;
    if(_imageArray.count==1)
    {
        UIImage*image=[UIImage imageNamed:_imageArray.firstObject];
        if(image.size.width){
            itemH=image.size.height/image.size.width*itemW;
        }
    }
    else
    {
        itemH=itemW;
    }

    long perRowItemCount=[self perRowItemCountForPicPathArray:_imageArray];
    CGFloat margin=10;
    
    [_imageArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        long columnIndex=idx % perRowItemCount;
        long rowIndex=idx / perRowItemCount;
        UIImageView*imageView=[_setImage objectAtIndex:idx];
        imageView.userInteractionEnabled=YES;
        imageView.hidden=NO;
        imageView.image=[UIImage imageNamed:obj];
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(imageArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    self.width = w;
    self.height = h;
    NSLog(@"%f %f",self.width,self.height);
    
    self.fixedHeight = @(h);
    self.fixedWidth = @(w);

    
    
    
    
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return 120;
    } else {
        CGFloat w = [UIScreen mainScreen].bounds.size.width > 320 ? 80 : 70;
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 2;
    } else {
        return 3;
    }
}


-(void)tap:(UITapGestureRecognizer *)View{
    
    UIView*imageView=View.view;
    SDPhotoBrowser*browser=[[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView=self;
    browser.imageCount=self.imageArray.count;
    browser.currentImageIndex=imageView.tag;
    browser.delegate=self;
    [browser show];
    
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
    UIImageView*imageView=self.subviews[index];
    return imageView.image;
}

@end
