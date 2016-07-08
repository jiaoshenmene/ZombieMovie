//
//  GGCommonFriendView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCommonFriendView.h"
#import "GGCommonFriendCell.h"
#import "GGFriendHelper.h"

@interface GGCommonFriendView()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *contentData;

@property (nonatomic , strong) GGFriendHelper *friendHelper;

@end

@implementation GGCommonFriendView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
        _friendHelper = [GGFriendHelper getInstance];
        [_friendHelper getFriendsList];
        GGWeakObj(self);
        
        _friendHelper.successfulBlock = ^(id object)
        {
            GGStrongObj(self);
            [self.tableView reloadData];
            
        };
        
        _contentData = _friendHelper.data;
        NSLog(@"%@",_contentData);
        
    }
    return self;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    return @"A";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _contentData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_contentData objectAtIndex:section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    GGCommonFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GGCommonFriendCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    GGUserGroup *usergroup = [_contentData objectAtIndex:indexPath.section] ;
    GGUser *user = [usergroup objectAtIndex:indexPath.row];
    cell.userData = user;
    
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [_delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    
}

@end
