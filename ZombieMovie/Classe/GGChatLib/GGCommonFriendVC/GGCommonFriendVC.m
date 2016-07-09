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

#import "EaseUserModel.h"

//#import "GGUserProfileManager.h"
#import "EaseChineseToPinyin.h"

@interface GGCommonFriendVC()<GGCommonFriendViewDelegate>
@property (nonatomic , strong) GGCommonFriendView *commonFriendView;
@property (nonatomic , strong) GGMessageVC *messageVC;

@property (nonatomic , strong) NSMutableArray *dataArray;

@property (nonatomic , strong) NSMutableArray<NSString *> *sectionTitles;

/*!
 @property
 @brief 聊天的会话对象
 */
@property (strong, nonatomic) EMConversation *conversation;


/*!
 @property
 @brief 加载的每页message的条数
 */
@property (nonatomic) NSInteger messageCountOfPage; //default 50


@end


@implementation GGCommonFriendVC
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _commonFriendView = [[GGCommonFriendView alloc] initWithFrame:self.view.bounds];
    _commonFriendView.delegate = self;
    [self.view addSubview:_commonFriendView];
    
    
    _messageVC = [[GGMessageVC alloc] init];
    
      [self initData];
    
    [self _sortDataArray:nil];
}

- (NSArray *)getFriendArray
{
    NSMutableArray *array = [NSMutableArray array];
    return array;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGUser *user = [[_commonFriendView.contentData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    GGMessageVC *messagevc = [[GGMessageVC alloc] initWithConversationChatter:user.userID conversationType:EMConversationTypeChat];
    messagevc.hidesBottomBarWhenPushed = YES;
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:messagevc animated:YES];
    
}

- (void) initData
{
    _sectionTitles = [NSMutableArray array];
    _dataArray = [NSMutableArray array];
    
}


- (void) _sortDataArray:(NSArray *)buddyList
{
    [_dataArray removeAllObjects];
    [_sectionTitles removeAllObjects];
    
    NSMutableArray<NSString *> *contactsSource = [NSMutableArray array];
    NSArray *blockList = [[EMClient sharedClient].contactManager getBlackListFromDB];
    NSLog(@"blockList = %@",blockList);
    
    for (NSString *buddy in blockList) {
        [contactsSource addObject:buddy];
    }
    NSLog(@"blockList = %@",contactsSource);
    
    UILocalizedIndexedCollation *indexCollation = [UILocalizedIndexedCollation currentCollation];
    [_sectionTitles addObjectsFromArray:indexCollation.sectionTitles];
    
    NSMutableArray *sortedArray = [NSMutableArray array];
    [_sectionTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *sectionArray = [NSMutableArray array];
        [sortedArray addObject:sectionArray];
    }];
    
    NSLog(@"sortedArray1 = %@",sortedArray);
    
    
    [contactsSource enumerateObjectsUsingBlock:^(NSString * _Nonnull buddy, NSUInteger idx, BOOL * _Nonnull stop) {
        EaseUserModel *model = [[EaseUserModel alloc] initWithBuddy:buddy];
        
//        NSString *firstLetter = [EaseChineseToPinyin pinyinFromChineseString:[[GGUserProfileManager sharedInstance] getNickNameWithUsername:buddy]];
//        
//        NSInteger section = [indexCollation sectionForObject:[firstLetter substringToIndex:1] collationStringSelector:@selector(uppercaseString)];
//        
//        NSMutableArray *array = [sortedArray objectAtIndex:section];
//        [array addObject:model];
        
    }];
    
    NSLog(@"sortedArray2 = %@",sortedArray);
    
    for (NSInteger i = [sortedArray count] - 1; i >= 0 ; i--) {
        NSArray *array = [sortedArray objectAtIndex:i];
        if ([array count] == 0) {
            [sortedArray removeObjectAtIndex:i];
            [_sectionTitles removeObjectAtIndex:i];
        }
    }
    
    [self.dataArray addObjectsFromArray:sortedArray];
    NSLog(@"dataArray = %@",self.dataArray);
    
}



@end
