//
//  SGMeVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/19.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGMeVC.h"
#import "SGMeMainView.h"
#import "SGPickerHeadVC.h"
#import "LoginVC.h"
#import "GGMeInfoVC.h"

@interface SGMeVC()<SGMeMainViewDel>

@property (nonatomic , strong) SGMeMainView *mMainView;
@property (nonatomic , strong) SGPickerHeadVC *vc;

@end

@implementation SGMeVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mMainView = [[SGMeMainView alloc] initWithFrame:self.view.bounds];
    _mMainView.delegate = self;
    [self.view addSubview:_mMainView];
    
    
    

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}
- (void)iconMethod:(id)sender
{
    _vc = [[SGPickerHeadVC alloc] init];
    [self presentViewController:_vc animated:YES completion:^{
        
    }];
}

- (void)gotoSettingVC
{
    self.navigationController.navigationBar.hidden = NO;
    LoginVC *loginvc = [[LoginVC alloc] init];
    [self.navigationController pushViewController:loginvc animated:YES];
    
}

- (void) goMeInfoVCMethod:(id)sender
{
    NSLog(@"qqqqqq");
    self.navigationController.navigationBar.hidden = NO;
    GGMeInfoVC *meInfovc = [[GGMeInfoVC alloc] init];
    [self.navigationController pushViewController:meInfovc animated:YES];
}
@end
