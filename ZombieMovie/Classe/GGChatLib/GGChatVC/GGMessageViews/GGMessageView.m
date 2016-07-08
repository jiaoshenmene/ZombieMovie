//
//  GGMessageView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/7.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMessageView.h"
#import "GGMessageBottomView.h"

size_t const bottomViewHeight = 50;

@interface GGMessageView()<UITableViewDelegate , UITableViewDataSource , GGMessageBottomViewDelegate>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) GGMessageBottomView *bottomView;
@end


@implementation GGMessageView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) - bottomViewHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
        _bottomView = [[GGMessageBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame), CGRectGetWidth(frame), bottomViewHeight)];
        _bottomView.delegate = self;
        [self addSubview:_bottomView];
        
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    
    return cell;
    
}

- (void) sendMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(sendMethod:)]) {
        [_delegate sendMethod:sender];
    }
}



@end
