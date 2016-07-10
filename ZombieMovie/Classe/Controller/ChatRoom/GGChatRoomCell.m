//
//  GGChatRoomCell.m
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGChatRoomCell.h"

@interface GGChatRoomCell()

@property (nonatomic , strong) UILabel *txtLabel;



@end

@implementation GGChatRoomCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _txtLabel = [[UILabel alloc] init];
        [self addSubview:_txtLabel];
        
    }
    return self;
}



@end
