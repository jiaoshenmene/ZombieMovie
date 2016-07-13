//
//  SGMeHeadView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGMeHeadView.h"
#import "GGStarView.h"



#define headTitleFont [UIFont systemFontOfSize:20]

#define idFont      [UIFont systemFontOfSize:18]
@interface SGMeHeadView()

@property (nonatomic , strong) UIView *headView;
@property (nonatomic , strong) UIButton *iconBtn;

@property (nonatomic , strong) UILabel *userIdLabel;

@property (nonatomic , strong) UILabel *userNikeLael;

@property (nonatomic , strong) GGStarView *starView;

@property (nonatomic , strong) UIButton *me_btn_edit;

@end

@implementation SGMeHeadView

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGRect rect = GGMainScreenFrame;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, self.frame.size.height)];
        _headView.backgroundColor = [UIColor colorWithHex:0x6ED0C8 alpha:1.0f];//colorWithRed:110/255.0 green:208/255.0 blue:200/255.0 alpha:1.0];
        [self addSubview:_headView];
        
        
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconBtn.frame = CGRectMake(rect.size.width / 2 -40, 10, 40, 40);

        
        [_iconBtn setTitle:@"头像" forState:UIControlStateNormal];
        [_iconBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_iconBtn addTarget:self action:@selector(iconMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:_iconBtn];
        
        
        NSString *idtxt = @"id:80086890";
        CGSize idsize = [idtxt sizeWithFontCompatible:idFont];
        _userIdLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(rect)- idsize.width) / 2  , CGRectGetMaxY(_iconBtn.frame), idsize.width, idsize.height)];
        _userIdLabel.font = idFont;
        _userIdLabel.text = idtxt;
        [_headView addSubview:_userIdLabel];
        NSString *userNikeString = @"ccc";
        CGSize nikeSize = [userNikeString sizeWithFontCompatible:headTitleFont ];
        _userNikeLael = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(rect)- nikeSize.width) / 2 - 25 -  nikeSize.height / 2, CGRectGetMaxY(_userIdLabel.frame), nikeSize.width, nikeSize.height)];
        _userNikeLael.font = headTitleFont;
        _userNikeLael.backgroundColor = [UIColor clearColor];
        _userNikeLael.text = userNikeString;
        [_headView addSubview:_userNikeLael];
        
        
        _starView = [[GGStarView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userNikeLael.frame), CGRectGetMinY(_userNikeLael.frame), 50, nikeSize.height) des:@"3" color:[UIColor clearColor]];
        [_headView addSubview:_starView];
        
        _me_btn_edit = [UIButton buttonWithType:UIButtonTypeCustom];
        _me_btn_edit.backgroundColor = [UIColor clearColor];
        [_me_btn_edit setImage:GGImage(@"me_btn_edit_h_") forState:UIControlStateNormal];
        _me_btn_edit.frame = CGRectMake(CGRectGetMaxX(_starView.frame), CGRectGetMinY(_userNikeLael.frame), nikeSize.height, nikeSize.height);
        [_headView addSubview:_me_btn_edit];
        [_me_btn_edit addTarget:self action:@selector(goMeInfoVCMethod:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}


- (void)setContentData:(SGMeData *)data
{
    _headView.frame = CGRectMake(0, 0, _headView.frame.size.width, data.cellHeight);
    
}

- (void)iconMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(iconMethod:)]) {
        [_delegate iconMethod:sender];
    }
}

- (void) goMeInfoVCMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(goMeInfoVCMethod:)]) {
        [_delegate goMeInfoVCMethod:sender];
    }
}

@end
