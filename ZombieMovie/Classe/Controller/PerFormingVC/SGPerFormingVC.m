//
//  SGPerFormingVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/19.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGPerFormingVC.h"
#import "LMLivePreview.h"

@implementation SGPerFormingVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[[LMLivePreview alloc] initWithFrame:self.view.bounds]];

    
}
@end
