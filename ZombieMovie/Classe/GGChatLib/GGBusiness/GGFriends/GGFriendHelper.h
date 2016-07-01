//
//  GGFriendHelper.h
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGFriendHelper : NSObject



/// 格式化的好友数据（二维数组，列表用）
@property (nonatomic, strong) NSMutableArray *data;

+ (GGFriendHelper *)getInstance;

@end
