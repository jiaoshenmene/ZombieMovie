//
//  GGChatRoomBottomView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGChatRoomBottomView.h"

size_t const btnroomwidth = 50;

size_t const space_x = 5;


@interface GGChatRoomBottomView()
@property (nonatomic , strong) UIButton *sendBtn;

@property (nonatomic , strong) UIButton *inputBtn;

@end


@implementation GGChatRoomBottomView
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//
        
        _inputBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [_inputBtn setTitle:@"send" forState:UIControlStateNormal];
        [_inputBtn setImage:[UIImage imageNamed:@"2.0_me_other_xin_"] forState:UIControlStateNormal];
        
        [_inputBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_inputBtn addTarget:self action:@selector(showInputView:) forControlEvents:UIControlEventTouchUpInside];
        _inputBtn.frame = CGRectMake(space_x, 0, btnroomwidth, CGRectGetHeight(frame));
        [self addSubview:_inputBtn];

        
    }
    return self;
}



- (void) showInputView:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(showInputView:)]) {
        [_delegate showInputView:sender];
    }
    
}



@end
