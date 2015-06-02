//
//  NetWorkingHTTP.h
//  NetWorkingHTTP
//
//  Created by mac on 15/6/2.
//  Copyright (c) 2015年 白仕云. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface BSYNetWorkingHTTP : NSObject
//检查网络是否可用
+ (BOOL)bsy_NetWorkIsNetWorking;
//post请求封装
+ (void)bsy_post:(NSString *)Url RequestParams:(NSDictionary *)params FinishBlock:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError)) block;
//get获取数据
+(NSString *)bsy_getDataByURL:(NSString *) url;
/**
 *  get获取图片
 */
+(UIImage *)bsy_getImageByURL:(NSString *) url;
@end
