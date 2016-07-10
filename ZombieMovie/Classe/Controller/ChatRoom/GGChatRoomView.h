//
//  GGChatRoomView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/9.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GGChatRoomViewDelegate <NSObject>

- (void) showInputView:(UIButton *)sender;

@end

@interface GGChatRoomView : UIView

@property (nonatomic , strong) id<GGChatRoomViewDelegate> delegate;
- (void)removeDelegate;


@end
