//
//  GGCommonFriendCell.m
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGCommonFriendCell.h"
#import "UIImageView+WebCache.h"

#define     FRIENDS_SPACE_X         10.0f
#define     FRIENDS_SPACE_Y         9.0f



@interface GGCommonFriendCell()
@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *usernameLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation GGCommonFriendCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftSeparatorSpace = FRIENDS_SPACE_X;
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.subTitleLabel];
        
        [self p_addMasonry];
    }
    return self;
}

#pragma mark - Public Methods
- (void) setUserData:(GGUser *)userData
{
    _userData = userData;
    
    
    if (userData.avatarPath) {
        [self.avatarImageView setImage:[UIImage imageNamed:userData.avatarPath]];
    }
    else {
        
        [self.avatarImageView sd_setImageWithURL:GGURL(userData.avatarURL) placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_PATH]];
    }
    
    [self.usernameLabel setText:userData.showName];
    NSLog(@"%@",userData.showName);
    [self.subTitleLabel setText:userData.detailInfo.remarkInfo];
    if (userData.detailInfo.remarkInfo.length > 0 && self.subTitleLabel.isHidden) {
        [self.subTitleLabel setHidden:NO];
        [self.usernameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarImageView).mas_offset(-9.5);
        }];
    }
    else if (userData.detailInfo.remarkInfo.length == 0 && !self.subTitleLabel.isHidden){
        [self.usernameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarImageView);
        }];
    }
}


#pragma mark - Prvate Methods -
- (void)p_addMasonry
{
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(FRIENDS_SPACE_X);
        make.top.mas_equalTo(FRIENDS_SPACE_Y);
        make.bottom.mas_equalTo(- FRIENDS_SPACE_Y + 0.5);
        make.width.mas_equalTo(self.avatarImageView.mas_height);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(FRIENDS_SPACE_X);
        make.centerY.mas_equalTo(self.avatarImageView);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(-20);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usernameLabel);
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).mas_offset(2);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(-20);
    }];
}



#pragma mark - Getter
- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
    }
    return _avatarImageView;
}

- (UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc] init];
        [_usernameLabel setFont:[UIFont systemFontOfSize:17.0]];
    }
    return _usernameLabel;
}

- (UILabel *)subTitleLabel
{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        [_subTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_subTitleLabel setTextColor:[UIColor grayColor]];
        [_subTitleLabel setHidden:YES];
    }
    return _subTitleLabel;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
