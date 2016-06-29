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


NSString *regsiterurl = @"http://localhost/ggsocialserver/ggresponse/ggregister.php";

NSString *testurl = @"http://localhost/studyTest.php";

@implementation GGRegisterVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    _registerview = [[GGRegisterView alloc] initWithFrame:self.view.bounds];
    _registerview.delegate = self;
    [self.view addSubview:_registerview];
    
    
}


- (void)registerSubmite:(id)sender username:(NSString *)username password:(NSString *)password
{
//    [[GGRegisterFunc getInstace] requestRegist:@"http://localhost/ggsocialserver/ggresponse/ggregister.php" params:@{@"username":username,@"password":password}];
    [[GGHTTPManager getInstance] POST:regsiterurl parameters:@{@"name":username,@"password":password} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject = %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error.localizedDescription = %@",error.localizedDescription);
    }];
    
    
    
    
}

@end
