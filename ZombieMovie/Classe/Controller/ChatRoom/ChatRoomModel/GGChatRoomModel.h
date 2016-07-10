//
//  GGChatRoomModel.h
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGChatRoomModel : NSObject
@property (nonatomic , assign) CGFloat cellHeight;
@property (nonatomic , strong) NSString *showTxt;

@property (nonatomic , assign) EMMessageBodyType messageType;

- (id) initWithModel:(EMMessage *)message;

@end
