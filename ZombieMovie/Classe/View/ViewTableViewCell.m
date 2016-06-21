//
//  ViewTableViewCell.m
//  ZombieMovie
//
//  Created by apple on 16/6/8.
//  Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import "ViewTableViewCell.h"
#import "UIImageView+WebCache.h"
#define UIScreen_Width [UIScreen mainScreen].bounds.size.width
#define UIScreen_Height [UIScreen mainScreen].bounds.size.height
@implementation ViewTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.nameLabel];
        [self addSubview:self.address];
        [self addSubview:self.peopleNumber];
        [self addSubview:self.coverImage];
    }
    return self;
}

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
//        _iconImage.backgroundColor = [UIColor redColor];
        _iconImage.layer.cornerRadius = _iconImage.frame.size.width/2;
        _iconImage.layer.masksToBounds = YES;
        CALayer *layer = [_iconImage layer];
        layer.borderColor = [[UIColor purpleColor] CGColor];
        layer.borderWidth = 1.5f;
    }
    return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImage.frame.origin.x+_iconImage.frame.size.width+10, _iconImage.frame.origin.y, UIScreen_Width, _iconImage.frame.size.height/2)];
        _nameLabel.text = @"映客";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UIButton *)address
{
    if (!_address) {
        self.address = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _address.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y+_nameLabel.frame.size.height, UIScreen_Width/2, _nameLabel.frame.size.height);
        [_address setImage:[UIImage imageNamed:@"address"] forState:(UIControlStateNormal)];
        [_address setTitle:@"中国" forState:(UIControlStateNormal)];
        [_address setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _address.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _address.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _address.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _address;
}

- (UILabel *)peopleNumber
{
    if (!_peopleNumber) {
        self.peopleNumber = [[UILabel alloc] initWithFrame:CGRectMake(_address.frame.origin.x+_address.frame.size.width, _address.frame.origin.y, UIScreen_Width/3-40, _address.frame.size.height)];
        _peopleNumber.text = @"9999";
        _peopleNumber.textColor = [UIColor purpleColor];
        _peopleNumber.font = [UIFont systemFontOfSize:15];
        _peopleNumber.textAlignment = NSTextAlignmentRight;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(_peopleNumber.frame.origin.x+_peopleNumber.frame.size.width, _peopleNumber.frame.origin.y+1.5, 30, _peopleNumber.frame.size.height)];
        label.text = @" 在看";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
       

    }
    return _peopleNumber;
}

- (UIImageView *)coverImage
{
    if (!_coverImage) {
        self.coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height+10, UIScreen_Width, ([UIScreen mainScreen].bounds.size.width * 618/480)+1

                                                                        -_iconImage.frame.size.height-20)];
//        _coverImage.backgroundColor = [UIColor redColor];
    }
    return _coverImage;
}

- (void)setViewModel:(ViewModel *)viewModel
{
    _viewModel = viewModel;
    
    // 用户名
    _nameLabel.text = viewModel.name;
    
    // 用户所在城市
    if ([viewModel.city isEqualToString:@""]) {
    [_address setTitle:@"难道在火星?" forState:(UIControlStateNormal)];
    }else{
    [_address setTitle:viewModel.city forState:(UIControlStateNormal)];
    }
    
    // 用户Image
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",viewModel.portrait]]];
    [_coverImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",viewModel.portrait]]];
    
    // 观看人数
    _peopleNumber.text = [NSString stringWithFormat:@"%d",viewModel.online_users];
    
    

}

@end
