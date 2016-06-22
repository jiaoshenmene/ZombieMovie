//
//  ViewController.m
//  ZombieMovie
//
//  Created by apple on 16/6/8.
// Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import "ViewController.h"


#import "LookLiveVC.h"
#import "SGPerFormingVC.h"

#import "SGMeVC.h"


@interface ViewController ()

@property (nonatomic, strong)UITabBarController *tabBarController;

@property (nonatomic, strong)LookLiveVC *llvc;
@property (nonatomic, strong) SGPerFormingVC *sgpfVC;
@property (nonatomic , strong) SGMeVC *sgmVC;



@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
     [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _llvc = [[LookLiveVC alloc] init];
    _sgpfVC = [[SGPerFormingVC alloc] init];
    _sgpfVC.title = @"go";
    _sgmVC = [[SGMeVC alloc] init];
    _sgmVC.title = @"我的";
    
    
    _tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:_llvc];
    nav1.title = @"look";
    
//    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:_sgpfVC];
//    
//    UINavigationController *nac3 = [[UINavigationController alloc] initWithRootViewController:_sgmVC];
   
    NSArray<UIViewController *> *vcs = @[nav1,_sgmVC,_sgpfVC];
    
    _tabBarController.viewControllers = vcs;
    
    [self.view addSubview:_tabBarController.view];
   
    // Do any additional setup after loading the view, typically from a nib.
}


@end
