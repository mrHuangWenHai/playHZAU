//
//  httpTool.h
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/5.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"

@interface httpTool : NSObject



+(void)upLoadBookwithParams:(NSDictionary*)params success:(void(^)(id responseObject))success failure:(void(^)(NSError*error))failure hud:(MBProgressHUD*)hud;

+(UIImage*)imageViewWithURL:(NSString*)urlString;
+(void)imageView:(UIImageView *)imageView WithURL:(NSString *)urlString;
+(void)bookDetailWith:(NSString*)stringUrl array:(NSMutableArray*)arry complete:(void(^)(void))completeBlock;
+(void)registerWith:(NSDictionary*)parameter succeed:(void(^)(NSDictionary*returnValue))completeBlock;
+(void)SaveAccountAndPassWordWithParamet:(NSDictionary*)par complete:(void(^)(NSDictionary*dic))completask;
+(void)loginWithParamet:(NSDictionary*)par complete:(void(^)(NSDictionary*dic))completask;
+(void)forgetPassWordWith:(NSDictionary*)dic complete:(void(^)(NSDictionary*dic))completask;
+(void)queryRunningNumber:(NSDictionary*)dic complete:(void(^)(NSDictionary*dic))completask;
@end