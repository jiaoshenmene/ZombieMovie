//
//  GGUser.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGUser.h"

@implementation GGUser

+ (NSDictionary *) modelContainerPropertyGenericClass
{
    return @{@"detailInfo":@"GGUserDetail",@"userSetting":@"GGUserSetting",@"chatSetting":@"GGUserChatSetting"};
}


- (NSString *)showName
{
    return self.remarkName.length > 0 ? self.remarkName : (self.nikename.length > 0 ? self.nikename : self.username);
}

@end
