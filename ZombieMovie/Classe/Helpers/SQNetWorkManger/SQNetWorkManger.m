//
//  SQNetWorkManger.m
//  ZombieMovie
//
//  Created by dujia on 16/6/24.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SQNetWorkManger.h"
#import "AFNetworking.h"

@interface SQNetWorkManger()
@property (nonatomic , strong) AFHTTPSessionManager *backgroundManager;

@end
@implementation SQNetWorkManger



//StaticInstanceImplementation(SQNetWorkManger)
//ObjectInitSelf
static SQNetWorkManger *_manager = nil;

+ (instancetype)getInstance
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[SQNetWorkManger alloc] initWithBaseURL:[NSURL URLWithString:sg_requestHead]];

        
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",nil];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"*/*",nil];
        
        _manager.requestSerializer.timeoutInterval = 10000000000;
        
//        AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//        
//        [policy setValidatesDomainName:NO];
//        
//        [policy setAllowInvalidCertificates:YES];
        
//        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//
//        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",nil];

        
       

    });
    return _manager;
}


- (void)GET:(NSString *)url params:(NSDictionary *)dic
{
    NSLog(@"%@",url);
    [_manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _successfulBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _failBlock(error);
    }];
}


- (void)POST:(NSString *)url params:(NSString *)string success:(SuccessfulBlock)success failed:(FailBlock)failedBlock
{
    NSString * URLString = [NSString stringWithFormat:@"%@/%@",sg_requestHead,url];//@"http://121.42.201.209:8081/api/users/login";
    NSURL * URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSData * postData = [string dataUsingEncoding:NSUTF8StringEncoding];  //将请求参数字符串转成NSData类型
  
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"post"]; //指定请求方式
    [request setURL:URL]; //设置请求的地址
    [request setHTTPBody:postData];  //设置请求的参数
    
    NSError * error;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (error) {
            failedBlock(connectionError);
            NSLog(@"error : %@",[error localizedDescription]);
        }else{
            success([[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//            NSLog(@"response : %@",response);
//            NSLog(@"backData1 : %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
}


@end
