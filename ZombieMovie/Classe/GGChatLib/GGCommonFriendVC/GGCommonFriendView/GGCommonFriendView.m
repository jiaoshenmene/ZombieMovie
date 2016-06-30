//
//  GGCommonFriendView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCommonFriendView.h"
#import "GGCommonFriendCell.h"


@interface GGCommonFriendView()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation GGCommonFriendView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    GGCommonFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GGCommonFriendCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    return cell;
    
}

@end
