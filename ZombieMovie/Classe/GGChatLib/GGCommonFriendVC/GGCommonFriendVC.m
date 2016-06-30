//
//  GGCommonFriendVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCommonFriendVC.h"
#import "GGCommonFriendView.h"


@interface GGCommonFriendVC()
@property (nonatomic , strong) GGCommonFriendView *commonFriendView;

@end


@implementation GGCommonFriendVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _commonFriendView = [[GGCommonFriendView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_commonFriendView];
    
}

- (NSArray *)getFriendArray
{
    NSMutableArray *array = [NSMutableArray array];
    return array;
}

@end
