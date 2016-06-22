//
//  SGPickerHeadView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGPickerHeadView.h"

@interface SGPickerHeadView()
@property (nonatomic , strong) UIImageView *iconView;
@property (nonatomic , strong) UIButton *pickPhotoBtn;
@property (nonatomic , strong) UIButton *caramePhotoBtn;

@end

@implementation SGPickerHeadView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGSize viewSize = [UIScreen mainScreen].applicationFrame.size;
        
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 400)];
        
        [self addSubview:_iconView];
        
        
        
        _pickPhotoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _pickPhotoBtn.frame = CGRectMake(viewSize.width / 2 - 100, viewSize.height - 150, 150, 50);
        [_pickPhotoBtn setTitle:@"photo" forState:UIControlStateNormal];
        [_pickPhotoBtn addTarget:self action:@selector(pickPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_pickPhotoBtn];
        
        
        
        _caramePhotoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _caramePhotoBtn.frame = CGRectMake(viewSize.width / 2 - 50, viewSize.height - 75, 100, 50);
        [_caramePhotoBtn setTitle:@"camera" forState:UIControlStateNormal];
        [_caramePhotoBtn addTarget:self action:@selector(caramePhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_caramePhotoBtn];
        
        
    }
    return self;
}

- (void)setIconImage:(UIImage *)image
{
    _iconView.image = image;
}

- (void) pickPhoto:(id)sender
{
    if ([_delegate respondsToSelector:@selector(pickPhoto:)]) {
        [_delegate pickPhoto:sender];
    }
    
}

- (void) caramePhoto:(id)sender
{
    if ([_delegate respondsToSelector:@selector(caramePhoto:)]) {
        [_delegate caramePhoto:sender];
    }
    
}

@end
