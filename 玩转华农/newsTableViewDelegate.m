//
//  newsTableViewDelegate.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/5/7.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "newsTableViewDelegate.h"
#import "newsHeadTableViewCell.h"
#import "newsTableViewCell.h"
@implementation newsTableViewDelegate

-(instancetype)init{
    if(self=[super init]){
        self.array=[NSMutableArray array];
        news*new;
        for(int i=1;i<=4;i++)
        {
            new=[[news alloc] init];
            new.title=@"“平语”近人—习近平如何关心人才工";
            new.detail=@"“致天下之治者在人才。”当今世界的综合国力竞争，说到底是人才竞争。古往今来，人才都是富国之本、兴邦大计。";
            [_array addObject:new];
        }
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%5==0){
        return 180;
    }
    else
        return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%5==0){
        newsHeadTableViewCell*cell;
        cell=[tableView dequeueReusableCellWithIdentifier:@"head"];
        if(cell==nil){
            cell=[[newsHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"head"];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        newsTableViewCell*cell;
        
        cell=[tableView dequeueReusableCellWithIdentifier:@"news"];
        if(cell==nil){
            cell=[[newsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"news"];
        }
        cell.model=_array[indexPath.row-1];
        return cell;
    }

    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    
    if(indexPat.row==0){return;}
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0,0,0)];
        
        
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
       // [cell setSeparatorInset:UIEdgeInsetsMake(-70, 30,-160, 90)];
        
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
}

@end
