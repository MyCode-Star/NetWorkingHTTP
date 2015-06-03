# NetWorkingHTTP-

1、在需要用到的头文件中引入NetWorkingHTTP和Reachability




2、使用需要的方法：post或者是get方法


3、具体使用方法如下

/**
 *  get获取json字符串
 */
-(void)buttonClick
{
    
NSString *url = @"http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";


    //有网络才发送请求
    if([BSYNetWorkingHTTP bsy_NetWorkIsNetWorking]){
    
        //发送请求，并且得到返回的数据
        
      NSString * str= [BSYNetWorkingHTTP bsy_getDataByURL:url];
        
        /**
         *  json字符串转字典
         */
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"   %@",dic);
    }
}
/**
 *  get获取图片
 */
- (void)imagebuttonClick {
- 

    
    NSString *url = @"http://f.hiphotos.baidu.com/image/pic/item/8b13632762d0f7035486c57d0bfa513d2697c55f.jpg";


    //有网络才发送请求
    
    if([BSYNetWorkingHTTP bsy_NetWorkIsNetWorking]){
    
        //发送请求，并且得到返回的数据
        
        UIImage * str= [BSYNetWorkingHTTP bsy_getImageByURL:url];


        UIImageView  *image =[[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
        image.image = str;
        [self.view addSubview:image];
    }

    // Dispose of any resources that can be recreated.
}
/**
 *  post    http://172.16.6.205:3000/mobile/signin
 */
-(void)postbuttonClick
{


    //有网络才发送请求
    
    if([BSYNetWorkingHTTP bsy_NetWorkIsNetWorking]){
   
        NSDictionary *tempDic = @{@"phone":@"baishiyun",
                                  @"passwd":@"123321",
                                  };
                                  
                                  
        [BSYNetWorkingHTTP bsy_post:@"http://172.16.6.205:3000/mobile/signin" RequestParams:tempDic FinishBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            NSLog(@"    %@",data);
        }];
        
    }
}
