//
//  GGLookChatView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/26.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGLookChatView.h"
#import "GGLookChatCell.h"


@interface GGLookChatView()<UITableViewDataSource , UITableViewDelegate>
@property (nonatomic , strong) UITableView *tableView;


@end

@implementation GGLookChatView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
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
    GGLookChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GGLookChatCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    return cell;
}


@end
