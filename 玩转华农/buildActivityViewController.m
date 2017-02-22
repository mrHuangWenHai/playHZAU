//
//  buildActivityViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/25.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "buildActivityViewController.h"
#import "buildActivityHeadView.h"
#import "Utils.h"
#import "tableViewDelegate.h"
#import "photoViewController.h"


@interface buildActivityViewController(){
    UITableView*tableView;
    tableViewDelegate*delegate;


}
@property(nonatomic,strong)photoViewController*photoTake;




@end


@implementation buildActivityViewController


-(instancetype)init{
    if([super init])
    {
        self.title=@"活动";
        

    }
    
    return self;
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor whiteColor];
    tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.frame)-60)];
    [self.view addSubview:tableView];
     delegate=[[tableViewDelegate alloc] init];
    
     buildActivityHeadView*headView= [[buildActivityHeadView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)/2+20)];
    tableView.tableHeaderView=headView;

    __weak typeof(self) weakSelf = self;
    headView.delegate=weakSelf;

    
    tableView.showsVerticalScrollIndicator=NO;
    tableView.showsHorizontalScrollIndicator=NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource=delegate;
    tableView.delegate=delegate;
    delegate.table=tableView;
    delegate.prensent=weakSelf;
    
    UIBarButtonItem*leftButton=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem=leftButton;
    

    CALayer*layer=[CALayer layer];
    layer.delegate=self;
    layer.frame=CGRectMake(0, 0, CGRectGetWidth(headView.frame), CGRectGetHeight(headView.frame)/3+30);
    [layer setNeedsDisplay];
    layer.zPosition=-1;
    [headView.imageView.layer addSublayer:layer];

    self.photoTake=[[photoViewController alloc] init];
    self.photoTake.myblock=^(UIImage*image){
        headView.imageView.image=image;
        [layer removeFromSuperlayer];
        headView.label.text=@"";
    };
   
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor ]}];
    [self.navigationController.navigationBar setBarTintColor:[Utils colorWithHexString:@"#2fb791"]];
    
   


}

-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textFieldBeginEdit{
    [UIView animateWithDuration:0.25 animations:^{
        float y=tableView.frame.origin.y;
        y-=30;
        CGRect fram=tableView.frame;
        fram.origin.y=y;
        tableView.frame=fram;
    }];
    
    
}
-(void)textViewBeginEdit{
    
    [UIView animateWithDuration:0.25 animations:^{
        float y=tableView.frame.origin.y;
        y-=150;
        CGRect fram=tableView.frame;
        fram.origin.y=y;
        tableView.frame=fram;
        
    }];

    
}

-(void)textFieldEndEdit{
    [UIView animateWithDuration:0.25 animations:^{
        float y=tableView.frame.origin.y;
        y+=30;
        CGRect fram=tableView.frame;
        fram.origin.y=y;
        tableView.frame=fram;
    }];

    
}

-(void)textViewEndEdit{
    [UIView animateWithDuration:0.25 animations:^{
        float y=tableView.frame.origin.y;
        y+=150;
        CGRect fram=tableView.frame;
        fram.origin.y=y;
        tableView.frame=fram;
    }];

}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGFloat width=CGRectGetWidth(layer.frame);
    CGFloat hight=CGRectGetHeight(layer.frame);
    
    CGContextSetLineWidth(ctx, 1);
    NSLog(@"adfas");
    const CGPoint point[] = {
        CGPointMake(width/2, 20),CGPointMake(width/2, 20+hight/3),
        CGPointMake(width/2-hight/6, 20+hight/6),CGPointMake(width/2-hight/6+hight/3, 20+hight/6)
    };
    CGFloat kp[]={2,2};
    
    CGContextSetStrokeColorWithColor(ctx, [Utils colorWithHexString:@"#2fb791"].CGColor);
    CGContextStrokeLineSegments(ctx, point, 4);
    
    CGContextSetLineDash(ctx, 0, kp, 2);
    
    CGContextStrokeRect(ctx,CGRectMake(5, 5, width-10,hight-10));
    

}

-(void)dealloc{
    NSLog(@"dealloc111111111111111111111111");
}

-(void)selectPhoto{
    


    
    [self createAlertController];
    


}

-(void)createAlertController{
    
    
    __weak typeof(self) weakSelf = self;
    UIAlertController* alertController =[UIAlertController alertControllerWithTitle:@"获取照片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction*photo=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.photoTake.typePhoto=@"1";
        [weakSelf pushPhoto];
    }];
    
    UIAlertAction*takePhoto=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.photoTake.typePhoto=@"2";
        [weakSelf pushPhoto];
    }];
    
    UIAlertAction*cancelPhoto=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:photo];
    [alertController addAction:takePhoto];
    [alertController addAction:cancelPhoto];
     [self presentViewController:alertController animated:YES completion:nil];

    
}

-(void)pushPhoto{
    [self presentViewController:_photoTake animated:YES completion:nil];

}

-(void)viewDidDisappear:(BOOL)animated{
}









@end
