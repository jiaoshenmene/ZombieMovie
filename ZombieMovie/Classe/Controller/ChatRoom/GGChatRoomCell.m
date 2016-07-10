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

@property (nonatomic , strong) NSString *from;

@property (nonatomic , strong) NSString *txt;

@end

@implementation GGChatRoomCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        _txtLabel = [[UILabel alloc] init];
        [self addSubview:_txtLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}



- (NSAttributedString *)gettxtLabelString
{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@:%@",_from,_txt]];
    return string;
}





- (void) setMessage:(GGChatRoomModel *)message
{
    _message = message;
    _txtLabel.text = _message.showTxt;
    _txtLabel.frame = CGRectMake(0, 0, 300, _message.cellHeight);
    
}

@end
