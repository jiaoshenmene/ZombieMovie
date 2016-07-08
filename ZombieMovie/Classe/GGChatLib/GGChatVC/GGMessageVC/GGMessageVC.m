//
//  GGMessageVC.m
//  ZombieMovie
//
//  Created by dujia on 16/7/7.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMessageVC.h"
#import "GGMessageView.h"


@interface GGMessageVC()
@property (nonatomic , strong) GGMessageView *messageView;
@end

@implementation GGMessageVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _messageView = [[GGMessageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_messageView];
    
    
}

@end
