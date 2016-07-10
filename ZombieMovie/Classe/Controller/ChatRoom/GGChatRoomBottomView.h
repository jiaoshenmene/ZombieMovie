//
//  GGChatRoomBottomView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGChatRoomBottomViewDelegate <NSObject>

- (void) sendMethod:(id)sender;

@end


typedef void(^SendMethod)(id sender);


@interface GGChatRoomBottomView : UIView
@property (nonatomic , weak) id<GGChatRoomBottomViewDelegate> delegate;
@property (nonatomic , strong) UITextField *inputTextField;

@property (nonatomic , copy) SendMethod sendMethod;

@end
