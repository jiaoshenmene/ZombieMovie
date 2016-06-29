//
//  LoginVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/24.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "LoginVC.h"
#import "SQNetWorkManger.h"
#import "GGRegisterVC.h"


@interface LoginVC()

@property (nonatomic , strong) UIButton *loginBtn;
@property (nonatomic , strong) UIButton *registerBtn;
@end

@implementation LoginVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginBtn.frame = CGRectMake(150, 300, 100, 30);
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_loginBtn addTarget:self action:@selector(loginMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _registerBtn.frame = CGRectMake(150, CGRectGetMaxY(_loginBtn.frame) + 100, 100, 30);
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_registerBtn addTarget:self action:@selector(registerMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
    
    
    
}


- (void) registerMethod
{
    
    GGRegisterVC *VC = [[GGRegisterVC alloc] init];
    [self presentViewController:VC animated:YES completion:^{
        
    }];
    
}

- (void) loginMethod
{
    ASIdentifierManager *identifierManager = [ASIdentifierManager sharedManager];
    NSUUID *uuid = identifierManager.advertisingIdentifier;
    
    NSString *accessToken = uuid.UUIDString;

    NSDictionary *dicjson = @{@"accessToken":accessToken,@"appId":@"shenqi"};
    NSString *jsonstring = [dicjson yy_modelToJSONString];
    
    NSString * URLString = @"http://121.42.201.209:8081/api/users/login";
    NSURL * URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSString * postString = jsonstring;//@"theRegionCode=广东";
    NSData * postData = [postString dataUsingEncoding:NSUTF8StringEncoding];  //将请求参数字符串转成NSData类型
    NSLog(@"jsonstring = %@",jsonstring);

    
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"post"]; //指定请求方式
    [request setURL:URL]; //设置请求的地址
    [request setHTTPBody:postData];  //设置请求的参数
    
    NSError * error;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
   [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       if (error) {
           NSLog(@"error : %@",[error localizedDescription]);
       }else{
           NSLog(@"response : %@",response);
           NSLog(@"backData1 : %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
       }
    }];
    
    
    
    
}
@end
