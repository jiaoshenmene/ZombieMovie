//
//  GGRegisterFunc.m
//  GGChat
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGRegisterFunc.h"
#import "GGHTTPManager.h"



@interface GGRegisterFunc()


@end

@implementation GGRegisterFunc




- (void) requestRegist:(NSString *)url params:(id)params
{
    [[GGHTTPManager getInstance] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

@end
