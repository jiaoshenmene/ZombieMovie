//
//  GGLiveRoomHeaderView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/11.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGLiveRoomHeaderView.h"

@interface GGLiveRoomHeaderView()
@property (nonatomic , strong) UIImageView *headerView;

@end

@implementation GGLiveRoomHeaderView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self addSubview:_headerView];
        
    }
    return self;
}

- (void)setHeadIconURL:(NSString *)url
{
    
    
}



@end
