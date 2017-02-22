//
//  choseView.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/3.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "choseView.h"
#import "Utils.h"

@implementation choseView
{
    UITableView*tab;
    BOOL isSelect;
    NSInteger selectRow;
    NSArray*array;
    NSIndexPath*lastPath;
    
    
}

-(instancetype)init{
    if([super init])
    {
 
        
        array=@[@"上午一二节",@"上午三四节",@"下午一二节",@"下午三四节",@"晚上"];
        selectRow=-1;
        lastPath=nil;
        float pad=20;
        self.backgroundColor=[UIColor whiteColor];
        isSelect=false;
        UILabel*label=[[UILabel alloc] init];
        label.text=@"请选择你要查询的时间段";
        label.textColor=[UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1];
        [label sizeToFit];
        [self addSubview:label];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(pad*2);
        }];

        tab=[[UITableView alloc] init];
        tab.delegate=self;
        tab.dataSource=self;
        tab.tag=10;
        tab.separatorStyle=UITableViewCellSeparatorStyleNone;
        tab.backgroundColor=[Utils colorWithHexString:@"#F57f17"];
        [self addSubview:tab];

        [tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(label).offset(pad*4);
            make.left.mas_equalTo(pad);
            make.right.mas_equalTo(-pad);
            make.bottom.mas_equalTo(-pad*2);
        }];
        UITapGestureRecognizer*tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTabview:)];
        [tab addGestureRecognizer:tap1];
        
        
        UITapGestureRecognizer*tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disappearView:)];
        [self addGestureRecognizer:tap2];
        
        UIButton*button1=[UIButton buttonWithType:UIButtonTypeSystem];
        [button1 setTitle:@"确定" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(selectOk) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
        [button1 setTitleColor:[UIColor colorWithRed:24/255.0 green:180/255.0 blue:237/255.0 alpha:1]forState:UIControlStateNormal];

        [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-pad+9);
            make.right.mas_equalTo(-pad);
        }];
        
        UIButton*button2=[UIButton buttonWithType:UIButtonTypeSystem];
        [button2 setTitle:@"取消" forState:UIControlStateNormal];
        [button2 addTarget:self action:@selector(cancelSelect) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(button1).offset(-pad*3);
            make.bottom.mas_equalTo(-pad+9);
            
        }];
        [button2 setTitleColor:[UIColor colorWithRed:24/255.0 green:180/255.0 blue:237/255.0 alpha:1]forState:UIControlStateNormal];
        
        
    }
    return self;
}


-(void)selectOk{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sumbit" object:self];
    
    
}

-(void)cancelSelect{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cancel" object:self];
    [UIView animateWithDuration:1 animations:^{
        self.alpha=1;
        self.alpha=0;
    }];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellId=@"ID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if(indexPath.row==selectRow)
    {
        cell.imageView.image=[UIImage imageNamed:@"evaluation_selected"];
    }
    else
    cell.imageView.image=[UIImage imageNamed:@"evaluation_unselected"];
    cell.textLabel.text=array[indexPath.row];
    cell.backgroundColor=[Utils colorWithHexString:@"#F57f17"];
    return cell;
    
}


-(void)disappearView:(UITapGestureRecognizer*)tap{
    if(isSelect)
    {
        [self removeFromSuperview];
    }
}

-(void)clickTabview:(UITapGestureRecognizer*)tap{
    CGPoint point=[tap locationInView:tab];
    NSIndexPath*indexPath= [tab indexPathForRowAtPoint:point];
    if(indexPath==nil)
    {
        return;
    }
    else
    {
        if(selectRow==indexPath.row)
        {
            selectRow=-1;
            isSelect=false;
            lastPath=nil;
            [tab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
        else
        {
            if(selectRow!=-1){
                
                selectRow=-1;
                [tab reloadRowsAtIndexPaths:@[lastPath] withRowAnimation:UITableViewRowAnimationNone];
                lastPath=nil;
            }
            lastPath=indexPath;
            
            selectRow=indexPath.row;
            isSelect=true;
            [tab reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    }

}


@end
