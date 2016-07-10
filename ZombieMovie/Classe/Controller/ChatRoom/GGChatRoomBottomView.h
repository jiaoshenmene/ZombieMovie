//
//  GGChatRoomBottomView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGChatRoomBottomViewDelegate <NSObject>



- (void) showInputView:(UIButton *)sender;

@optional



@end







@interface GGChatRoomBottomView : UIView
@property (nonatomic , weak) id<GGChatRoomBottomViewDelegate> delegate;
@end
