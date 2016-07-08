//
//  GGCommonFriendVC.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCommonFriendVC.h"
#import "GGCommonFriendView.h"
#import "GGMessageVC.h"

@interface GGCommonFriendVC()<GGCommonFriendViewDelegate>
@property (nonatomic , strong) GGCommonFriendView *commonFriendView;
@property (nonatomic , strong) GGMessageVC *messageVC;
@end


@implementation GGCommonFriendVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _commonFriendView = [[GGCommonFriendView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_commonFriendView];
    
    
    _messageVC = [[GGMessageVC alloc] init];
    
}

- (NSArray *)getFriendArray
{
    NSMutableArray *array = [NSMutableArray array];
    return array;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:_messageVC animated:YES];
    
}

@end
