//
//  GGLoginVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGLoginVC.h"
#import "GGLoginView.h"
#import "GGHTTPManager.h"

const static NSString *loginURL = @"ggsocialserver/ggresponse/gglogin.php";

@interface GGLoginVC()<GGLoginViewDelegate>

@property (nonatomic , strong) GGLoginView *loginView;

@end

@implementation GGLoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _loginView = [[GGLoginView alloc] initWithFrame:self.view.bounds];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
}


- (void) login:(id)sender username:(NSString *)username password:(NSString *)password
{
//    [[GGHTTPManager getInstance] POST:[NSString stringWithFormat:@"%@%@",GGRequestHeader,loginURL] parameters:@{@"name":username,@"password":password} progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject = %@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error.localizedDescription = %@",error.localizedDescription);
//    }];
    
    EMError *error = [[EMClient sharedClient] loginWithUsername:username password:password];
    if (!error) {
        [[EMClient sharedClient].options setIsAutoLogin:YES];
        NSLog(@"登录成功");
    }
}
@end
