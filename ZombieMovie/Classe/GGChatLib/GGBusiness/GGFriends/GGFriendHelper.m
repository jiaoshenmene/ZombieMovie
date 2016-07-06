//
//  GGFriendHelper.m
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGFriendHelper.h"

#import "GGUser.h"

NSString *getFriendsList = @"http://localhost/ggsocialserver/ggresponse/getFriendsList.php";


static GGFriendHelper *_friendHelper = nil;
@interface GGFriendHelper()


@end

@implementation GGFriendHelper
+ (GGFriendHelper *)getInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _friendHelper = [[GGFriendHelper alloc] init];
    });
    return _friendHelper;
}



- (id) init
{
    if (self = [super init]) {
        _data = [NSMutableArray arrayWithObjects:self.defaultGroup, nil];
        [self testData];
        
        

    }
    return self;
}

- (void)testData
{
    
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        NSLog(@"获取成功 -- %@",userlist);
    }

    
    GGUserGroup *group = [[GGUserGroup alloc] init];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"FriendList" ofType:@"json"];
//    NSData *jsonData = [NSData dataWithContentsOfFile:path];
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    
    [userlist enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        GGUser *user = [[GGUser alloc] init];
//        [user yy_modelSetWithJSON:obj];
        user.userID = obj;
        user.remarkName = obj;
        
        [group.users addObject:user];
    }];
    
    [_data addObject:group];
   
}


- (void) getFriendsList
{
    
     GGUserGroup *group = [[GGUserGroup alloc] init];
    [[GGHTTPManager getInstance] POST:getFriendsList parameters:@{@"username":@"nae"} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSArray <NSDictionary *>*  _Nullable responseObject) {
        NSLog(@"responseObject = %@",responseObject);
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GGUser *user = [[GGUser alloc] init];
            [user yy_modelSetWithJSON:obj];
            [group.users addObject:user];
        }];
        [_data addObject:group];
        
        _successfulBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (GGUserGroup *)defaultGroup
{
    if (!_defaultGroup) {
        GGUser * user1 = [[GGUser alloc] init];
        user1.userID = @"-1";
        user1.avatarPath = @"friends_new";
        user1.remarkName = @"new friends";
        
        GGUser * user2 = [[GGUser alloc] init];
        user2.userID = @"-2";
        user2.avatarPath = @"friends_new";
        user2.remarkName = @"Saved Groups";
        
        
        GGUser * user3 = [[GGUser alloc] init];
        user3.userID = @"-3";
        user3.avatarPath = @"friends_new";
        user3.remarkName =@"Tags";
        
        
        GGUser * user4 = [[GGUser alloc] init];
        user4.userID = @"-4";
        user4.avatarPath = @"friends_new";
        user4.remarkName = @"Official Accounts";
        
        
        
        
        _defaultGroup = [[GGUserGroup alloc] initWithGroupName:nil users:[NSMutableArray arrayWithObjects:user1,user2,user3,user4, nil]];
    }
    
    return _defaultGroup;
    
}


@end
