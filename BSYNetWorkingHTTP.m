//
//  NetWorkingHTTP.m
//  NetWorkingHTTP
//
//  Created by mac on 15/6/2.
//  Copyright (c) 2015年 白仕云. All rights reserved.
//

#import "BSYNetWorkingHTTP.h"
@implementation BSYNetWorkingHTTP
//这个函数是判断网络是否可用的函数（wifi或者蜂窝数据可用，都返回YES）
+ (BOOL)bsy_NetWorkIsNetWorking{
    if(
       ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]
        != NotReachable)
       &&
       ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]
        != NotReachable)
       ){
        return YES;
    }else{
        return NO;
    }
}

//post异步请求封装函数
+ (void)bsy_post:(NSString *)URL RequestParams:(NSDictionary *)params FinishBlock:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError)) block{
    //把传进来的URL字符串转变为URL地址
    NSURL *url = [NSURL URLWithString:URL];
    //请求初始化，可以在这针对缓存，超时做出一些设置
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:20];
    //解析请求参数，用NSDictionary来存参数，通过自定义的函数parseParams把它解析成一个post格式的字符串
    NSString *parseParamsResult = [self parseParams:params];
    NSData *postData = [parseParamsResult dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    
    //创建一个新的队列（开启新线程）
    NSOperationQueue *queue = [NSOperationQueue new];
    //发送异步请求，请求完以后返回的数据，通过completionHandler参数来调用
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:block];
}

//把NSDictionary解析成post格式的NSString字符串
+ (NSString *)parseParams:(NSDictionary *)params{
    NSString *keyValueFormat;
    NSMutableString *result = [NSMutableString new];
    //实例化一个key枚举器用来存放dictionary的key
    NSEnumerator *keyEnum = [params keyEnumerator];
    id key;
    while (key = [keyEnum nextObject]) {
        keyValueFormat = [NSString stringWithFormat:@"%@=%@&",key,[params valueForKey:key]];
        [result appendString:keyValueFormat];
        NSLog(@"post()方法参数解析结果：%@",result);
    }
    return result;
}

/**
 *  get请求
 */
// 将网络数读取为字符串
+ (NSString *)bsy_getDataByURL:(NSString *) url {
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]] encoding:NSUTF8StringEncoding];
}

//读取网络图片
+(UIImage *)bsy_getImageByURL:(NSString *) url {
    return [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
}
@end
