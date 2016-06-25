//
//  SGMeMainView.m
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "SGMeMainView.h"
#import "SGMeHeadView.h"




static NSString *cellIdentifier = @"cellIdentifier";

static NSString *cellSetting = @"cellSetting";

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
        mData.identify = @"cellIdentifier";
        mData.cellHeight = 300;
        
        
        [_contentArray addObject:mData];
        
        SGMeData *mData1 = [[SGMeData alloc] init];
        mData1.identify = cellSetting;
        mData1.cellHeight = 80;
        
        
        [_contentArray addObject:mData1];
        
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
    
    SGMeData *mData = [_contentArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mData.identify];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([cellIdentifier isEqualToString:mData.identify]) {
        if (!cell) {
            SGMeHeadView *tmpCell = [[SGMeHeadView alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mData.identify];
            
            tmpCell.delegate = self;
            cell = tmpCell;
            
        }
        [(SGMeHeadView *)cell setContentData:mData];
    }else if([cellSetting isEqualToString:mData.identify]){
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mData.identify];
        }
        cell.textLabel.text = @"setting";
        
    }
    
    
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SGMeData *mData = [_contentArray objectAtIndex:indexPath.row];
    if ([mData.identify isEqualToString:cellSetting]) {
        if ([_delegate respondsToSelector:@selector(gotoSettingVC)]) {
            [_delegate gotoSettingVC];
        }
    }
    
}

- (void)iconMethod:(id)sender
{
    if ([_delegate respondsToSelector:@selector(iconMethod:)]) {
        [_delegate iconMethod:sender];
    }
}



@end
