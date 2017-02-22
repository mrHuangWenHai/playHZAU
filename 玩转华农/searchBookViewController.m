//
//  searchBookViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/5.
//  Copyright © 2016年 huang. All rights reserved.
//


// 头部视图的高度
#define kHeadHeight 240
// 最低高度（导航栏的高度）
#define kHeadMinHeight 64


#import "searchBookViewController.h"
#import "Masonry.h"
#import "httpTool.h"
#import "cellBookTableViewCell.h"
#import "MBProgressHUD.h"
#import "Utils.h"
#import "cellModal.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"
#import "SDRefresh.h"
#import "UIImage+UIImage_Extension_h.h"





@interface searchBookViewController ()<MBProgressHUDDelegate>{
    UITableView*tab;
    UISearchBar*search;
    BOOL show;
    NSMutableArray*array;
    MBProgressHUD*hud;
    cellModal*model;
    SDRefreshFooterView *_refreshFooter;
    int a;
    UIPageControl*page;


}
@property(nonatomic,strong)NSMutableArray*detailUrl;
@property(nonatomic,copy)NSMutableString*str;
@property(nonatomic,strong)UIScrollView*scroll;



@end

@implementation searchBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    
    self.detailUrl=[NSMutableArray array];
    array=[NSMutableArray array];
    self.str=[NSMutableString string];
    self.scroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, -160, [self cellContentViewWith], 160)];
    _scroll.pagingEnabled=YES;
    _scroll.tag=1;
    page=[[UIPageControl alloc] init];
    page.frame=CGRectMake([self cellContentViewWith]/2-40, 135, 80, 20);
    page.currentPage=0;
    page.numberOfPages=4;
    page.pageIndicatorTintColor=[UIColor grayColor];
    page.currentPageIndicatorTintColor=[UIColor redColor];
    page.hidesForSinglePage=YES;
    [page addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    _scroll.delegate=self;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    a=1;
    
    show=true;

    
    
    self.view.backgroundColor=[UIColor whiteColor];
    tab=[[UITableView alloc] init];
    tab.delegate=self;
    tab.dataSource=self;
    hud=[[MBProgressHUD alloc] initWithView:self.view];
    hud.labelText=@"搜索中.....";
    hud.margin=15;

    
    search=[[UISearchBar alloc] init];
    search.placeholder=@"请输入你要搜索的书名";
    search.delegate=self;
    search.showsBookmarkButton=YES;
    
    UIView*view=[[UIView alloc] init];
    view.backgroundColor=[UIColor grayColor];
    tab.tableFooterView=view;
    [self.view addSubview:tab];
    [self.view addSubview:hud];

    
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    hud.mode=MBProgressHUDModeAnnularDeterminate;
    hud.delegate=self;
    
    tab.scrollEnabled=YES;
    CGFloat width=[self cellContentViewWith];
    UIImageView*imageview1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 160)];
    imageview1.image=[UIImage imageNamed:@"1"];
    UIImageView*imageView2=[[UIImageView alloc] initWithFrame:CGRectMake(width,0,width,160)];
    imageView2.image=[UIImage imageNamed:@"2"];
    UIImageView*imageView3=[[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, width, 160)];
    imageView3.image=[UIImage imageNamed:@"3"];
    UIImageView*imageView4=[[UIImageView alloc] initWithFrame:CGRectMake(width*3, 0, width, 160)];
    imageView4.image=[UIImage imageNamed:@"4"];
    
    [_scroll addSubview:imageview1];
    [_scroll addSubview:imageView2];
    [_scroll addSubview:imageView3];
    [_scroll addSubview:imageView4];
    
    
    UITapGestureRecognizer*gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    gesture.delegate=self;
    [tab addGestureRecognizer:gesture];
    [tab addSubview:_scroll];
    
    
    

    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [tab registerClass:[cellBookTableViewCell class] forCellReuseIdentifier:@"cellBookTableViewCell"];
    
    _refreshFooter=[SDRefreshFooterView refreshView];
    [_refreshFooter addToScrollView:tab];
    __weak typeof(self) weakSelf = self;
    __weak typeof(_refreshFooter)weakRefreshFooter=_refreshFooter;
    //__weak typeof(_str)weakstr=_str;
    _refreshFooter.beginRefreshingOperation=^(){
        NSMutableDictionary*dic=[NSMutableDictionary dictionary];
        dic[@"func"]=@"BSN";
        NSLog(@"%@",_str);
        dic[@"REID"]=_str;
        a+=10;
        NSLog(@"..........%d",a);
        dic[@"PGN"]=[NSString stringWithFormat:@"%d",a];
       
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf searchbook:dic];
            
        });

        
    };
    [_scroll addSubview:page];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden=NO;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView                                              // any offset changes
{
    if(scrollView.tag!=1)
    {
        CGFloat offsetY =tab.contentOffset.y;
        
        // 计算tabView滚动的偏移量
    
        
        
        
        UIImage *image ;
        // 透明度
        CGFloat alpha = 0;
        if (offsetY>0) {
            alpha = 0.9;
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
              image= [UIImage imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:alpha]];
            self.navigationController.navigationBar.tintColor=[UIColor greenColor];


        } else {
            alpha = 0;
            self.navigationController.navigationBar.tintColor=[UIColor whiteColor];

            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
            image = [UIImage imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:alpha]];

        }
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        NSLog(@"...%f",tab.contentOffset.y);
}
    
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    if([NSStringFromClass([touch.view class])isEqualToString:@"UITableViewCellContentView"]&&show)
    {
        return NO;
    }
    return YES;
}

-(void)cancel{
    [search resignFirstResponder];
}


-(void)viewWillLayoutSubviews{
    tab.contentInset=UIEdgeInsetsMake(160, 0, 0, 0);
    _scroll.contentSize=CGSizeMake([self cellContentViewWith]*4, 160);
    
    search.frame=CGRectMake(0, 0, CGRectGetWidth(tab.bounds), 30);
    tab.tableHeaderView=search;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",(unsigned long)array.count);
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    cellModal* modal=array[indexPath.row];
        return [tab cellHeightForIndexPath:indexPath model:modal keyPath:@"modal" cellClass:[cellBookTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  __block cellBookTableViewCell*cell=(cellBookTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cellBookTableViewCell"];
    if(cell==nil)
    {
        cell=[[cellBookTableViewCell alloc] init];
        cell.restorationIdentifier=@"cellBookTableViewCell";


    }
    cellModal*modal=array[indexPath.row];
    cell.modal=modal;
   // [cell reloadModal:modal];
    show=true;
    return cell;


    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)searchbook:(NSDictionary*)params{

    
    [httpTool upLoadBookwithParams:params success:^(id responseObject) {
        NSArray*_array=(NSArray*)responseObject;
        for(NSDictionary*dic in _array)
        {
            cellModal*mod=[[cellModal alloc] init];
            mod.bookImageUrl=dic[@"img_url"];
            mod.searchNum=dic[@"call_number"];
            mod.author=dic[@"author"];
            mod.publish=dic[@"publish"];
            mod.nameOfBook=dic[@"book_name"];
            mod.numberInLibrary=dic[@"left"];
            self.str=dic[@"request_id"];
            
            NSLog(@"%@",self.str);

            [array addObject:mod];
            
        }
        [tab reloadData];
        [hud hide:YES];
        [_refreshFooter endRefreshing];

        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    } hud:hud];
    
    

    
}


-(void)viewDidAppear:(BOOL)animated{
    
}


-(void)viewDidLayoutSubviews {
    
    if ([tab respondsToSelector:@selector(setSeparatorInset:)]) {
        [tab setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([tab respondsToSelector:@selector(setLayoutMargins:)])  {
        [tab setLayoutMargins:UIEdgeInsetsZero];
    }
    
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    show=false;
    return true;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    dic[@"func"]=@"booksearch";
    dic[@"bookname"]=searchBar.text;
    hud.progress=0.5;
    [hud show:YES];
    [self searchbook:dic];
    [searchBar resignFirstResponder];
    show=true;
    
}





- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWidth=CGRectGetWidth(scrollView.frame);
    NSUInteger pagenum=floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    page.currentPage=pagenum%4;
    CGRect bounds=_scroll.bounds;
    CGRect bounds2=page.frame;
    bounds2.origin.x=CGRectGetWidth(bounds)*page.currentPage+[self cellContentViewWith]/2-40;
    page.frame=bounds2;

}


-(void)changePage:(id)sender{
    NSLog(@"%huang");
    NSInteger pageNum=[sender currentPage];
    CGRect bounds=_scroll.bounds;
    bounds.origin.x=CGRectGetWidth(bounds)*pageNum;
    bounds.origin.y=0;
    CGRect bounds2=page.frame;
    bounds2.origin.x=CGRectGetWidth(bounds)*pageNum+[self cellContentViewWith]/2-40;
    page.frame=bounds2;
    [_scroll scrollRectToVisible:bounds animated:YES];
}

@end
