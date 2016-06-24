//
//  SGLookLiveModel.h
//  ZombieMovie
//
//  Created by dujia on 16/6/22.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SGLLStreamer.h"

@interface SGLookLiveModel : NSObject


@property (nonatomic , strong) NSString *appInstance;
@property (nonatomic , strong) NSString *description;
@property (nonatomic , strong) NSString *thumbnailLink;
@property (nonatomic , strong) NSNumber *totalViewers;
@property (nonatomic , strong) NSString *owner;
@property (nonatomic , strong) SGLLStreamer *streamer;
@property (nonatomic , strong) NSString *duration;
@property (nonatomic , strong) NSString *roomId;
@property (nonatomic , strong) NSNumber *createdAt;
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSNumber *live;
@property (nonatomic , strong) NSString *streamId;
@property (nonatomic , strong) NSNumber *deletedAt;
@property (nonatomic , strong) NSNumber *totalStickers;
@property (nonatomic , strong) NSString *viewLink;

@end
