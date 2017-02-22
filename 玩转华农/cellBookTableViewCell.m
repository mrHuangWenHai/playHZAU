//
//  cellBookTableViewCell.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/5.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "cellBookTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "SDWebImage/UIImageView+WebCache.h"


@implementation cellBookTableViewCell{
    UIImageView*bookImage;
    UILabel*authorOfBook;
    UILabel*serachNum;
    UILabel*nameOfBook;
    UILabel*detailOfBook;
    UILabel*publishOfbook;
    UILabel*bookNumINLibrary;
    
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setup];
    }
    
    return self;
}

-(void)setup{
    bookImage=[UIImageView new];
    authorOfBook=[UILabel new];
    authorOfBook.font=[UIFont systemFontOfSize:14];
    authorOfBook.textColor= [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    bookNumINLibrary=[UILabel new];
    bookNumINLibrary.font=[UIFont systemFontOfSize:14];
    bookNumINLibrary.textColor= [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    serachNum=[UILabel new];
    serachNum.font=[UIFont systemFontOfSize:14];
    serachNum.textColor= [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    nameOfBook=[UILabel new];
    nameOfBook.font=[UIFont systemFontOfSize:14];
    nameOfBook.textColor= [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    publishOfbook=[UILabel new];
    publishOfbook.font=[UIFont systemFontOfSize:14];
    publishOfbook.textColor= [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    
    
    NSArray*array=@[nameOfBook,publishOfbook,serachNum,authorOfBook,bookImage,bookNumINLibrary,];
    
    [self.contentView sd_addSubviews:array];
    
    UIView*contentView=self.contentView;
    
    bookImage.sd_layout
    .leftSpaceToView(contentView,10)
    .topSpaceToView(contentView,15)
    .widthIs(100)
    .heightIs(100);
    
    authorOfBook.sd_layout
    .topEqualToView(bookImage)
    .leftSpaceToView(bookImage,10)
    .rightSpaceToView(contentView,0)
    .heightIs(20);
    
    publishOfbook.sd_layout
    .topSpaceToView(authorOfBook,10)
    .leftSpaceToView(bookImage,10)
    .rightSpaceToView(contentView,0)
    .heightIs(20);
    
    serachNum.sd_layout
    .topSpaceToView(publishOfbook,10)
    .leftSpaceToView(bookImage,10)
    .rightSpaceToView(contentView,0)
    .heightIs(20);
    
    bookNumINLibrary.sd_layout
    .topSpaceToView(serachNum,10)
    .leftSpaceToView(bookImage,10)
    .rightSpaceToView(contentView,10)
    .autoHeightRatio(0);
    
    nameOfBook.sd_layout
    .topSpaceToView(bookImage,10)
    .leftSpaceToView(contentView,10)
    .rightEqualToView(contentView)
    .autoHeightRatio(0);
    
    
    [self setupAutoHeightWithBottomView:nameOfBook bottomMargin:20];
    //[self setupAutoHeightWithBottomViewsArray:@[nameOfBook,bookNumINLibrary] bottomMargin:20];

    
}

-(void)setModal:(cellModal *)modal///必须复写这个方法，才能自适应，否则不能自适应。
{
    
    _modal=modal;
    [bookImage sd_setImageWithURL:[NSURL URLWithString:modal.bookImageUrl] placeholderImage:[UIImage imageNamed:@"icon3"]];
    authorOfBook.text=[NSString stringWithFormat:@"作者: %@",modal.author];
    [authorOfBook sizeToFit];

    serachNum.text=[NSString stringWithFormat:@"索书号:%@",modal.searchNum];
    [serachNum sizeToFit];
    publishOfbook.text=[NSString stringWithFormat:@"出版社:%@",modal.publish];
    [publishOfbook sizeToFit];
    bookNumINLibrary.text=[NSString stringWithFormat:@"在馆数: %@",modal.numberInLibrary];
    [bookNumINLibrary sizeToFit];
    [publishOfbook sizeToFit];
    nameOfBook.text=modal.nameOfBook;
    NSLog(@"%@",modal.bookImageUrl);
    
    
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
