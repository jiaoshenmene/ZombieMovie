//
//  GGChatRoomView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/9.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGChatRoomView.h"
#import "GGChatRoomBottomView.h"
#import "GGChatRoomCell.h"

#import "GGChatRoomModel.h"


CGFloat const crbottomHeight = 50;

@interface GGChatRoomView()<UITableViewDataSource , UITableViewDelegate , EMChatManagerDelegate , GGChatRoomBottomViewDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) GGChatRoomBottomView *bottomView;

@property (nonatomic , strong) NSMutableArray<GGChatRoomModel *> *dataArray;

@end

@implementation GGChatRoomView

- (void) dealloc
{
   
    
    
}


- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        _dataArray = [NSMutableArray array];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) - crbottomHeight)     style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor ];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:_tableView];
        
        [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
        
        
        _bottomView = [[GGChatRoomBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame), CGRectGetWidth(frame), crbottomHeight)];
        _bottomView.delegate = self;
        [self addSubview:_bottomView];
        
        
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[_dataArray objectAtIndex:indexPath.row] cellHeight];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    GGChatRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[GGChatRoomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    cell.message = [_dataArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
}


- (void)didReceiveMessages:(NSArray *)aMessages
{
    for (EMMessage *message in aMessages) {
        GGChatRoomModel *model = [[GGChatRoomModel alloc] initWithModel:message];
        [_dataArray addObject:model];
    }
    [_tableView reloadData];
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
    [_tableView scrollToRowAtIndexPath:newIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}





- (void)removeDelegate
{
    [[EMClient sharedClient].chatManager removeDelegate:self];
}

- (void) showInputView:(UIButton *)sender
{
    
    if ([_delegate respondsToSelector:@selector(showInputView:)]) {
        [_delegate showInputView:sender];
    }
}








@end
