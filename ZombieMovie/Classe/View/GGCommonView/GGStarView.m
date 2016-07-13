//
//  GGStarView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGStarView.h"


@interface GGStarView()

@property (nonatomic , strong) UIImageView *starView;
@property (nonatomic , strong) NSString *des;
@property (nonatomic , strong) UIColor *bgcolor;


@end

@implementation GGStarView
- (id) initWithFrame:(CGRect)frame des:(NSString *)des color:(UIColor *)color
{
    if (self = [super initWithFrame:frame]) {
        _starView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetHeight(frame))];
        _starView.image = [UIImage imageNamed:@"me_myaccount_reddiamond"];
        [self addSubview:_starView];
        
        UILabel *desLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_starView.frame) + 3, 0,CGRectGetWidth(frame) - CGRectGetHeight(frame), CGRectGetWidth(frame) - CGRectGetHeight(frame) - 3)];
        desLabel.text = des;
        [self addSubview:desLabel];
        
        self.backgroundColor = color;
        
    }
    return self;
}
@end
