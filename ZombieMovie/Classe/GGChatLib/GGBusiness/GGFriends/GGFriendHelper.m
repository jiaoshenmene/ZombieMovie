//
//  GGFriendHelper.m
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGFriendHelper.h"

static GGFriendHelper *_friendHelper = nil;
@interface GGFriendHelper()


@end

@implementation GGFriendHelper
+ (GGFriendHelper *)getInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _friendHelper = [[GGFriendHelper alloc] init];
    });
    return _friendHelper;
}



- (id) init
{
    if (self = [super init]) {
        _data = [NSMutableArray array];
        
        
        
        
    }
    return self;
}





@end
