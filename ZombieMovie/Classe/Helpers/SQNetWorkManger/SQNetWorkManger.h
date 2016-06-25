//
//  SQNetWorkManger.h
//  ZombieMovie
//
//  Created by dujia on 16/6/24.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void (^SuccessfulBlock)(id object);
typedef void (^FailBlock)(NSError *error);


@interface SQNetWorkManger : AFHTTPSessionManager

@property (nonatomic, copy)SuccessfulBlock successfulBlock;// 成功回调属性
@property (nonatomic, copy)FailBlock failBlock;// 失败回调属性



+ (instancetype)getInstance;
- (void)GET:(NSString *)url params:(NSDictionary *)dic;

- (void)POST:(NSString *)url params:(NSString *)string success:(SuccessfulBlock)success failed:(FailBlock)failedBlock;

@end
