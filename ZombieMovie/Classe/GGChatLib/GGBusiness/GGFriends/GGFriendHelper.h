//
//  GGFriendHelper.h
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGUserGroup.h"


typedef void (^SuccessfulBlock)(id object);
typedef void (^FailBlock)(NSError *error);


@interface GGFriendHelper : NSObject

@property (nonatomic , copy) SuccessfulBlock successfulBlock;

@property (nonatomic , copy) FailBlock failBlock;

/// 格式化的好友数据（二维数组，列表用）
@property (nonatomic , strong) NSMutableArray *data;

@property (nonatomic  , strong) GGUserGroup *defaultGroup;

+ (GGFriendHelper *)getInstance;
- (void) getFriendsList;


@end
