//
//  SGLLStreamer.h
//  ZombieMovie
//
//  Created by dujia on 16/6/22.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGLLStreamer : NSObject

@property (nonatomic , strong) NSString *description;
@property (nonatomic , strong) NSString *platformId;
@property (nonatomic , strong) NSString *updatedAt;
@property (nonatomic , strong) NSString *id;
@property (nonatomic , strong) NSString *createdAt;
@property (nonatomic , strong) NSString *permissions;
@property (nonatomic , strong) NSNumber *isSubscribed;
@property (nonatomic , strong) NSString *platformType;
@property (nonatomic , strong) NSString *alias;

@property (nonatomic , strong) NSString *location;
@property (nonatomic , strong) NSString *deletedAt;
@property (nonatomic , strong) NSString *totalStickers;
@property (nonatomic , strong) NSString *viewLink;


@end
