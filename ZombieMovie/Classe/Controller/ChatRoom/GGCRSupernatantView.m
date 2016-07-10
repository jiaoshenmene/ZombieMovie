//
//  GGCRSupernatantView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCRSupernatantView.h"
#import "GGChatRoomView.h"

#import "GGCRInputView.h"


CGFloat const crviewheight = 250;
CGFloat const crviewrightGap = 100;


@interface GGCRSupernatantView()<UIScrollViewDelegate , GGChatRoomViewDelegate>



@property (nonatomic , strong) GGCRInputView * inputView;
@property (nonatomic, strong) GGChatRoomView *chatRoomView;
@property (nonatomic , strong) UIScrollView *mScrollView;

@property (nonatomic , strong) UIView *controlView;

@end

@implementation GGCRSupernatantView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    
        
        CGRect rect = GGMainScreenFrame;
        
        
        
        
        _mScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _mScrollView.backgroundColor = [UIColor clearColor];
        _mScrollView.delegate = self;
        _mScrollView.pagingEnabled = YES;
        _mScrollView.showsHorizontalScrollIndicator = NO;
        _mScrollView.contentSize = CGSizeMake(CGRectGetWidth(frame) * 2, CGRectGetHeight(frame));
        [self addSubview:_mScrollView];
        
        _controlView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame), 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _controlView.backgroundColor = [UIColor clearColor];
        
        [_mScrollView addSubview:_controlView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [_mScrollView addGestureRecognizer:tap];
        
        
        _chatRoomView = [[GGChatRoomView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(rect) - crviewheight, CGRectGetWidth(rect) - crviewrightGap, crviewheight)];
        [_controlView addSubview:_chatRoomView];
        _chatRoomView.delegate = self;
        
        
        _inputView = [[GGCRInputView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mScrollView.frame), CGRectGetWidth(frame), 50)];
    
        [self addSubview:_inputView];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        
        
        
    }
    return self;
}

- (void) tap:(UITapGestureRecognizer *)gesture
{
    [_inputView.inputTextField resignFirstResponder];
}

- (void) keyboardWillShow:(NSNotification *)notification
{
    CGRect rect = GGMainScreenFrame;
     NSDictionary *userInfo = notification.userInfo;
    // 键盘的frame
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    GGWeakObj(self);
    [UIView animateWithDuration:0.3f animations:^{
        GGStrongObj(self);
        [self.mScrollView setY:- CGRectGetHeight(keyboardF) - 50];
         [self.inputView setY:CGRectGetHeight(rect) - CGRectGetHeight(keyboardF) - 50];
    }];
}

- (void) keyboardWillHide:(NSNotification *)notification
{
    GGWeakObj(self);
    [UIView animateWithDuration:0.3f animations:^{
        GGStrongObj(self);
        [self.mScrollView setY:0 ];
        [self.inputView setY:CGRectGetMaxY(self.mScrollView.frame)];
    }];
}

- (void)showInputView:(UIButton *)sender
{
    [_inputView.inputTextField becomeFirstResponder];
   
    
}

@end
