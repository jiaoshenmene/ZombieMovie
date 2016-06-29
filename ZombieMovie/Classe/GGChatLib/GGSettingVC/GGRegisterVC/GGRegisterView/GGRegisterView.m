//
//  GGRegisterView.m
//  GGChat
//
//  Created by dujia on 16/6/28.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGRegisterView.h"

const float mOriginX = 10;
const float mTop = 100;
const float uLabelWidth = 80;
const float uLabelHeight = 50;
const float ufieldWidth = 150;

const float mSpaceHeight = 10;

@interface GGRegisterView()
@property (nonatomic , strong) UITextField *usernameField;

@property (nonatomic , strong) UITextField *userpasswordField;

@property (nonatomic , strong) UITextField *userConfirmField;

@property (nonatomic , strong) UIButton *submitBtn;


@end

@implementation GGRegisterView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        
        [self initView];
   
        
    }
    return self;
}



- (void)initView
{
    UILabel *unameLabel = [[UILabel alloc] initWithFrame:CGRectMake(mOriginX, mTop, uLabelWidth, uLabelHeight)];
    unameLabel.text = @"username";
    [self addSubview:unameLabel];
    
    
    
    
    
    _usernameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(unameLabel.frame), CGRectGetMinY(unameLabel.frame), ufieldWidth, uLabelHeight)];
    _usernameField.text = @"zxcvb123";
    [self addSubview:_usernameField];
    
    
    
    UILabel *upasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(mOriginX, CGRectGetMaxY(unameLabel.frame) + mSpaceHeight, uLabelWidth, uLabelHeight)];
    upasswordLabel.text = @"password";
    [self addSubview:upasswordLabel];
    
    
    _userpasswordField= [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(upasswordLabel.frame), CGRectGetMinY(upasswordLabel.frame), ufieldWidth, uLabelHeight)];
    _userpasswordField.text = @"0987123";
    [self addSubview:_userpasswordField];
    
    UILabel *uconfirmLabel = [[UILabel alloc] initWithFrame:CGRectMake(mOriginX, CGRectGetMaxY(upasswordLabel.frame) + mSpaceHeight, uLabelWidth, uLabelHeight)];
    uconfirmLabel.text = @"confirm";
    [self addSubview:uconfirmLabel];
    
    
    _userConfirmField= [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(uconfirmLabel.frame), CGRectGetMinY(uconfirmLabel.frame), ufieldWidth, uLabelHeight)];
    [self addSubview:_userConfirmField];
    
    
    _submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_submitBtn setTitle:@"submit" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn addTarget:self action:@selector(submitMethod:) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.frame = CGRectMake(CGRectGetMidX(self.frame) - ufieldWidth / 2, CGRectGetMaxY(uconfirmLabel.frame) + mSpaceHeight , ufieldWidth, uLabelHeight);
    [self addSubview:_submitBtn];
    
}






- (void) submitMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(registerSubmite:username:password:)]) {
        [_delegate registerSubmite:sender username:_usernameField.text password:_userpasswordField.text];
    }
    
}












@end
