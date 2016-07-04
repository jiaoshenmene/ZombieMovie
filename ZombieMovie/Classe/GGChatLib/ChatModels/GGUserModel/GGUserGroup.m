//
//  GGUserGroup.m
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGUserGroup.h"

@implementation GGUserGroup

- (id) initWithGroupName:(NSString *)groupName users:(NSMutableArray *)users
{
    if (self = [super init]) {
        self.groupName = groupName;
        self.users = users;
    }
    return self;
}

- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

- (NSInteger) count
{
    return self.users.count;
}

- (void) addObject:(id)anObject
{
    [self.users addObject:anObject];
}

- (id) objectAtIndex:(NSUInteger)index
{
    return [self.users objectAtIndex:index];
}

@end
