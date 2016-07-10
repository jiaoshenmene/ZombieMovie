//
//  GGChatRoomBottomView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGChatRoomBottomView.h"

size_t const btnroomwidth = 50;

@interface GGChatRoomBottomView()
@property (nonatomic , strong) UIButton *sendBtn;
@end


@implementation GGChatRoomBottomView
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, frame.size.width - 30 - btnroomwidth, CGRectGetHeight(frame))];
        _inputTextField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_inputTextField];
        
        _sendBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_sendBtn setTitle:@"send" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendMethod:) forControlEvents:UIControlEventTouchUpInside];
        _sendBtn.frame = CGRectMake(CGRectGetMaxX(_inputTextField.frame), 0, btnroomwidth, CGRectGetHeight(frame));
        [self addSubview:_sendBtn];
        
    }
    return self;
}

- (void) sendMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(sendMethod:)]) {
        [_delegate sendMethod:sender];
    }
    
    if (_sendMethod) {
        _sendMethod(sender);
    }
}



@end
