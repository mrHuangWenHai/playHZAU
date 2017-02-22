//
//  httpTool.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/5.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "httpTool.h"
#import "TFHpple.h"

//    NSString*urlString=@"http://104.168.156.38:8888/";


@implementation httpTool
+(void)upLoadBookwithParams:(NSDictionary*)params success:(void(^)(id responseObject))success failure:(void(^)(NSError*error))failure hud:(MBProgressHUD *)hud{
    
    NSString*urlString=@"http://192.168.1.143:8888/";
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [manger GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        hud.progress=downloadProgress.fractionCompleted;
        NSLog(@"%f..",downloadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray* dic=[NSJSONSerialization JSONObjectWithData:responseObject options:nil error:nil];
        success(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];
    
    
    
    
}

+(void)imageView:(UIImageView *)imageView WithURL:(NSString *)urlString{
    
    __weak typeof(imageView)iv=imageView;
    [imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] placeholderImage:[UIImage imageNamed:@"evaluation_add"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        
        dispatch_queue_t queue=dispatch_get_main_queue();
        dispatch_async(queue, ^{
            iv.image=image;
            
            
        });
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}


+(void)bookDetailWith:(NSString*)stringUrl array:(NSMutableArray*)arry complete:(void(^)(void))completeBlock{
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    NSLog(@"ppppppppppaaaaaa");
    
    [manger GET:stringUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString*string=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSData*htmlData=[string dataUsingEncoding:NSUTF8StringEncoding];
        NSString*nodeString=@"//td";
        TFHpple*xpathParser=[[TFHpple alloc] initWithHTMLData:htmlData];
        
        NSArray*dataArray=[xpathParser searchWithXPathQuery:nodeString];
        for(TFHppleElement*hppleElement in dataArray)
        {
            if([hppleElement.attributes[@"class"] isEqualToString:@"td1"]&&[hppleElement.attributes[@"align"] isEqualToString:@"left"])
            {
                NSLog(@"%@",hppleElement.text);
                if(hppleElement.text.length>30)
                {
                 [arry addObject:hppleElement.text];
                    completeBlock();
                    break;
                 //NSLog(@"%@",arry);
                }
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

+(void)registerWith:(NSDictionary*)parameter succeed:(void(^)(NSDictionary*returnValue))completeBlock{
    
    
    NSLog(@"11111");
    NSString*urlString=@"http://192.168.1.143:8888/";

    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completeBlock(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    

//    
//    NSMutableDictionary*param=[NSMutableDictionary dictionary];
//    param[@"__VIEWSTATE"]=@"dDwyODE2NTM0OTg7Oz61eIbnKVojBioGYtg2vsy2SklwiA==";
//    param[@"txtUserName"]=@"2014317200120";
//    param[@"TextBox2"]=@"HUANGwenhai520";
//    param[@"txtSecretCode"]=parameter[@"checkCode"];
//    param[@"RadioButtonList1"]=[NSMutableString stringWithString:@"%D1%A7%C9%FA"];
//    param[@"Button1"]=@"";
//    param[@"lbLanguage"]=@"";
//    param[@"hidPdrs"]=@"";
//    param[@"hidsc"]=@"";
//    
//    
//    
//    [manger POST:@"http://jw.hzau.edu.cn" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
    
}

+(void)SaveAccountAndPassWordWithParamet:(NSDictionary*)par complete:(void(^)(NSDictionary*dic))completask{
    
    NSString*urlString=@"http://192.168.1.103:8888/";
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:par progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completask(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
   
}

+(void)loginWithParamet:(NSDictionary*)par complete:(void(^)(NSDictionary*dic))completask{
    NSString*urlString=@"http://192.168.1.143:8888/";
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:par progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completask(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

+(void)forgetPassWordWith:(NSDictionary *)dic complete:(void (^)(NSDictionary *))completask{
    NSString*urlString=@"http://192.168.1.143:8888/";
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completask(dic);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

+(void)queryRunningNumber:(NSDictionary *)dic complete:(void (^)(NSDictionary *))completask{
    NSString*urlString=@"http://192.168.1.143:8888/";
    AFHTTPSessionManager*manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:urlString parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completask(dic);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}








@end
