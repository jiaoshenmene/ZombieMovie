//
//  SGMeHeadView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGMeHeadView.h"


@interface SGMeHeadView()

@property (nonatomic , strong) UIView *headView;
@property (nonatomic , strong) UIButton *iconBtn;


@end

@implementation SGMeHeadView

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, self.frame.size.height)];
        _headView.backgroundColor = [UIColor colorWithHex:0x6ED0C8 alpha:1.0f];//colorWithRed:110/255.0 green:208/255.0 blue:200/255.0 alpha:1.0];
        [self addSubview:_headView];
        
        
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconBtn.frame = CGRectMake([UIScreen mainScreen].applicationFrame.size.width / 2 -20, 100, 40, 40);
        
        [_iconBtn setTitle:@"头像" forState:UIControlStateNormal];
        [_iconBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_iconBtn addTarget:self action:@selector(iconMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:_iconBtn];
        
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



@end
