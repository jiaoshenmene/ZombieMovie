//
//  SGMeMainView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGMeMainView.h"
#import "SGMeHeadView.h"

@interface SGMeMainView()<UITableViewDelegate,UITableViewDataSource,SGMeHeadViewDel>
@property (nonatomic , strong) UITableView *mTableView;

@property (nonatomic , strong) NSMutableArray *contentArray;
@end

@implementation SGMeMainView
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _mTableView = [[UITableView alloc] initWithFrame:frame];
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        [self addSubview:_mTableView];
        
        _contentArray = [NSMutableArray array];
        SGMeData *mData = [[SGMeData alloc] init];
        mData.cellHeight = 300;
        [_contentArray addObject:mData];
        
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contentArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[_contentArray objectAtIndex:indexPath.row] cellHeight];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    SGMeHeadView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SGMeHeadView alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.delegate = self;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SGMeData *mData = [_contentArray objectAtIndex:indexPath.row];
    [cell setContentData:mData];
    
    
    return cell;
    
}

- (void)iconMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(iconMethod:)]) {
        [_delegate iconMethod:sender];
    }
}



@end
