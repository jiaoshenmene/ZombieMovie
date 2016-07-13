//
//  GGMeInfoView.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMeInfoView.h"

#import "GGMeInfoCell.h"
#import "GGMeInfoData.h"
#import "GGMeInfoFrame.h"

@interface GGMeInfoView()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableview;

@property (nonatomic , strong) NSMutableArray<GGMeInfoFrame *>  *dataArray;


@end

@implementation GGMeInfoView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSDictionary *dic = @{@"title":@"头像",@"rightImageName":@"default_head"};
        
        NSDictionary *dic1 = @{@"title":@"昵称",@"rightTxt":@"hi333u",@"rightImageName":@"b_qq_h"};
        
        NSDictionary *dic2 = @{@"title":@"id号",@"rightTxt":@"ff444"};
        
        NSDictionary *dic3 = @{@"title":@"性别",@"rightImageName":@"b_qq_h"};
        _dataArray = [NSMutableArray array];
        NSArray<NSDictionary *> *testArr = @[dic,dic1,dic2,dic3];
        [testArr enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GGMeInfoData *data = [[GGMeInfoData alloc] init];
            [data yy_modelSetWithJSON:obj];
            GGMeInfoFrame *frame = [[GGMeInfoFrame alloc] initWithData:data];
            [_dataArray addObject:frame];
        }];
        
        
        
        
        _tableview = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self addSubview:_tableview];
        
    }
    return self;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
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
    GGMeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GGMeInfoCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
    }
    cell.meinfoFrame = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}



@end
