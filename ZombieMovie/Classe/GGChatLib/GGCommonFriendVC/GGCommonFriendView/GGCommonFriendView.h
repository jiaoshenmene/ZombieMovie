//
//  GGCommonFriendView.h
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//
#import "GGFriendHelper.h"

@protocol GGCommonFriendViewDelegate <NSObject>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end


@interface GGCommonFriendView : UIView


@property (nonatomic , weak) id<GGCommonFriendViewDelegate> delegate;

@property (nonatomic , strong) NSMutableArray *contentData;

@end
