//
//  GGMeInfoVC.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMeInfoVC.h"
#import "GGMeInfoView.h"


@interface GGMeInfoVC()
@property (nonatomic , strong) GGMeInfoView *meinfoview;

@end

@implementation GGMeInfoVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"edit infomation";
    
    _meinfoview = [[GGMeInfoView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_meinfoview];
}
@end
