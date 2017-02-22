//
//  tableViewDelegate.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/26.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "tableViewDelegate.h"
#import "headerView.h"
#import "insertCell.h"
#import "Utils.h"
#import "ZLPhotoActionSheet.h"
#import "clockView.h"
#import "head.h"


@interface tableViewDelegate(){
    BOOL flag;
    BOOL insert;
    NSIndexPath*path;
    ZLPhotoActionSheet *actionSheet;
    NSMutableArray*selectTimeArray;
}

@property(nonatomic,copy)NSArray*array;
@property(nonatomic,strong)NSMutableArray* selectPhoto;


@end

@implementation tableViewDelegate

-(instancetype)init
{
    if([super init])
    {
        flag=false;
        insert=false;
        self.array=@[@"报名截止",@"人数限制",@"活动咨询电话",@"可见范围",@"用户报名必须填",@"容许参与者分享和邀请",@"推荐给参与者的好友",@"需要审核申请者"];
        actionSheet = [[ZLPhotoActionSheet alloc] init];
        actionSheet.maxSelectCount=9;
        actionSheet.maxSelectCount=9;
        self.selectPhoto=[NSMutableArray array];
        selectTimeArray=[NSMutableArray arrayWithObjects:@"2016-03-26-14:57",@"2016-03-26-14:57",@"2016-03-26-14:57", nil];

    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger interage;
    switch (section) {
        case 0:
            interage=1;
            break;
        case 1:
            interage=2;
            break;
        case 2:
            interage=1;
            break;
        case 3:
            if(flag)
            {
                if(insert)
                    interage=9;
                else
                interage=8;
            }
            else
            interage=0;
            break;
        default:
            break;
    }
    NSLog(@"interage=%ld",interage);
    
    return interage;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*mycell=@"ID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:mycell];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mycell];
    }
    cell.imageView.image=nil;
    
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=@"最多支持9张图片";
            cell.detailTextLabel.text=@"0/2500";
            cell.imageView.image=[UIImage imageNamed:@"pic"];
            cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr"]];

            break;
        case 1:
            if(indexPath.row==0)
            {
                cell.textLabel.text=@"开始时间";
                cell.detailTextLabel.text=selectTimeArray[0];
                cell.imageView.image=[self imagelow:[UIImage imageNamed:@"cl"]];
                cell.clipsToBounds=YES;
            
            }
            else
            {
                cell.textLabel.text=@"结束时间";
                cell.detailTextLabel.text=selectTimeArray[1];
                cell.imageView.image=[self imagelow:[UIImage imageNamed:@"cl1"]];

            }
            cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr"]];

            
            break;
        case 2:
            cell.textLabel.text=@"活动地点";
            cell.detailTextLabel.text=@"输入活动地址";
            cell.imageView.image=[self imagelow:[UIImage imageNamed:@"location"]];
            cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr"]];

            break;
        case 3:
            if(flag)
            {
            if(insert&&indexPath.row>=6)
            cell.textLabel.text=_array[indexPath.row-1];
            else
            cell.textLabel.text=_array[indexPath.row];
            cell.detailTextLabel.text=[self detailOfCell:indexPath];
            if(indexPath.row>3)
            {
                if(insert&&indexPath.row==5)
                {
                    cell=[[insertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my"];
                    return cell;
                    
                }
                else
                {
                    if (indexPath.row==5) {
                        path=indexPath;
                    }
                    UISwitch*mySwitch=[[UISwitch alloc] init];
                    mySwitch.onTintColor=[Utils colorWithHexString:@"#ef795c"];
                    cell.accessoryView=mySwitch;
                    if(indexPath.row==4)
                    {
                        if(insert) mySwitch.on=true;
                        [mySwitch addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
                    }
                    
                }
            }
            else{
                cell.accessoryView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arr"]];
            }
                
            }
        default:
            break;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.layer.borderColor=[UIColor colorWithRed:238/256 green:238/256 blue:239/256 alpha:0.2].CGColor;
    cell.layer.borderWidth=0.4;
    cell.layer.shouldRasterize=YES;
    cell.layer.rasterizationScale=[UIScreen mainScreen].scale;
    
    return cell;
}

-(NSString*)detailOfCell:(NSIndexPath *)indexPath{
    NSMutableString*string;
    
    switch (indexPath.row) {
        case 0:
            string=selectTimeArray[2];
            break;
        case 1:
            string=[NSMutableString stringWithFormat:@"无限制"];
            break;
        case 2:
            string=nil;
            break;
        case 3:
            string=[NSMutableString stringWithFormat:@"好友可见"];
            break;
        default:
            string=nil;
            break;
    }
    
    return string;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(insert&&indexPath.row==5)
    {
        return 120;
    }
    return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section==3)
    {
        return 40;
    }
    else return 0;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section==3)
    {
        NSLog(@"dddddddddddd");
        headerView*head=[[headerView alloc] headrViewWithTableView:tableView];
        head.userInteractionEnabled=YES;
        head.delegate=self;
        return head;
    }
    return nil;
}

-(void)reloadThisTableView{
    flag=!flag;
    if(!flag) insert=false;
    [self.table reloadData];
}

-(UIImage*)imagelow:(UIImage*)image{
    UIGraphicsBeginImageContext(image.size);
    CGRect rect=CGRectMake(10, 12, 20, 20);
    [image drawInRect:rect];
    UIImage*newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)change:(UISwitch*)Switch{
    NSLog(@"row=%ld selection=%ld",(long)path.row,(long)path.section);
    NSArray*array=@[path];
    insert=!insert;
    if(Switch.on)
    [self.table insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationLeft];
   else
    [self.table deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationRight];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0)
    {
        actionSheet.select=_selectPhoto;
            [actionSheet showWithSender:_prensent animate:YES completion:^(NSArray<UIImage *> * _Nonnull selectPhotos) {
                
                for (int i = 0; i < selectPhotos.count; i++) {
                    
                    [_selectPhoto addObject:selectPhotos[i]];
                }
            }];
    }
    else{
        if(indexPath.section==1||(indexPath.section==3&&indexPath.row==0)){
            int a;
            clockView*view=[[clockView alloc] initWithFrame:appRect];
            if(indexPath.section==1&&indexPath.row==0) a=0;
            else if(indexPath.section==1&&indexPath.row==1) a=1;
            else a=2;
            view.cell=[tableView cellForRowAtIndexPath:indexPath];
            view.time=selectTimeArray;
            view.a=a;
            [_prensent.view addSubview:view];
        }
    }
}




@end
