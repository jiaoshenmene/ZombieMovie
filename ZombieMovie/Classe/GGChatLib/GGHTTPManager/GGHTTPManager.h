//
//  GGHTTPManager.h
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface GGHTTPManager : AFHTTPSessionManager
+ (instancetype)getInstance;

@end
