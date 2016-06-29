//
//  GGRegisterVC.m
//  GGChat
//
//  Created by dujia on 16/6/28.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGRegisterVC.h"
#import "GGRegisterView.h"
#import "GGRegisterFunc.h"


@interface GGRegisterVC()<GGRegisterViewDelegate>

@property (nonatomic , strong) GGRegisterView *registerview;

@end



@implementation GGRegisterVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    _registerview = [[GGRegisterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_registerview];
    
    
}


- (void)registerSubmite:(id)sender username:(NSString *)username password:(NSString *)password
{
    
}

@end
