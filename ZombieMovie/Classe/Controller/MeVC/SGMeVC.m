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
- (void)iconMethod:(id)sender
{
    _vc = [[SGPickerHeadVC alloc] init];
    [self presentViewController:_vc animated:YES completion:^{
        
    }];
}


@end
