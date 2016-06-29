//
//  GGRegisterFunc.h
//  GGChat
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 dujia. All rights reserved.
//


#import "GGHTTPManager.h"


@interface GGRegisterFunc : GGHTTPManager

- (void)requestRegist:(NSString *)url params:(NSDictionary *)params;



@end
