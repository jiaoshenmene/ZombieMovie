//
//  GGHTTPManager.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGHTTPManager.h"



NSString * _Nonnull  headerString = @"127.0.0.1";



@interface GGHTTPManager()
@property (nonatomic , strong) AFHTTPSessionManager *sessionManager;


@end

@implementation GGHTTPManager
static NSString * const AFAppDotNetAPIBaseURLString = @"https://127.0.0.1/";


+ (instancetype)getInstance
{
    static GGHTTPManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[GGHTTPManager alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    });
    
    return _sharedClient;
    
}

@end
