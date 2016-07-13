//
//  GGMeInfoCell.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMeInfoCell.h"

@interface GGMeInfoCell()

@property (nonatomic , strong) UILabel *titleLabel;

@property (nonatomic , strong) UIImageView *rightImageView;

@property (nonatomic , strong) UILabel *rightTxtLabel;

@property (nonatomic , strong) UIView *cellView;


@end

@implementation GGMeInfoCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GGMainScreenFrame.size.width, 0)];
        [self addSubview:_cellView];
        
        _titleLabel = [[UILabel alloc] init];
        [_cellView addSubview:_titleLabel];
        
        
        _rightImageView = [[UIImageView alloc] init];
        [_cellView addSubview:_rightImageView];
        
        _rightTxtLabel = [[UILabel alloc] init];
        _rightTxtLabel.font = [UIFont systemFontOfSize:10];
        [_cellView addSubview:_rightTxtLabel];
        
        
        
    }
    return self;
}

- (void) setMeinfoFrame:(GGMeInfoFrame *)meinfoFrame
{
    _meinfoFrame = meinfoFrame;
    
    
    [_cellView setHeight:_meinfoFrame.cellHeight];
    
    _titleLabel.text = _meinfoFrame.infodata.title;
    _titleLabel.font = _meinfoFrame.titleFont;
    _titleLabel.frame = _meinfoFrame.titleF;
    
    _rightImageView.image = _meinfoFrame.rightImage;
    _rightImageView.frame = _meinfoFrame.rightImageF;
    
    _rightTxtLabel.text = _meinfoFrame.infodata.rightTxt;
    _rightTxtLabel.frame = _meinfoFrame.rightTxtF;
    
    
    
    
    
    
}

@end
