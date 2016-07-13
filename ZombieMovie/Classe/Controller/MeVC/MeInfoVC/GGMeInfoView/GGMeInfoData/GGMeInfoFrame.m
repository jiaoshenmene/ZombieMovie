//
//  GGMeInfoFrame.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGMeInfoFrame.h"

#define spaceXL  10

#define spaceXR  15

#define infoCellHeight 80

#define infoCellRightFont [UIFont systemFontOfSize:10]

#define infoCellSpace  20



@implementation GGMeInfoFrame


- (instancetype) initWithData:(GGMeInfoData *)infodata
{
    if (self = [super init]) {
        self.infodata = infodata;
    }
    return self;
}

- (void)setInfodata:(GGMeInfoData *)infodata
{
    _infodata = infodata;
    _cellHeight = infoCellHeight;
    
    _titleFont = [UIFont systemFontOfSize:15];
    
    
    
    CGFloat x = spaceXL;
    CGSize titleSize = [_infodata.title sizeWithFontCompatible:_titleFont];
    CGFloat y = [self getCenterPoint:infoCellHeight childHeight:titleSize.height];
    
    _titleF = CGRectMake(x, y, titleSize.width, titleSize.height);
    
    if ([_infodata.rightImageName isStringSafe]) {
        _rightImage = GGImage(_infodata.rightImageName);
        CGSize rightImageSize = _rightImage.size;
        x = GGMainScreenFrame.size.width - ( rightImageSize.width + spaceXR);
        y = [self getCenterPoint:infoCellHeight childHeight:rightImageSize.height];
        _rightImageF = CGRectMake(x, y, rightImageSize.width, rightImageSize.height);
    }
    
    if ([_infodata.rightTxt isStringSafe]) {
        CGSize rightTxtSize = [_infodata.rightTxt sizeWithFontCompatible:infoCellRightFont];
        x = GGMainScreenFrame.size.width -CGRectGetMinY(_rightImageF) - rightTxtSize.width - infoCellSpace;
        y = [self getCenterPoint:infoCellHeight childHeight:rightTxtSize.height];
        _rightTxtF = CGRectMake(x, y, rightTxtSize.width, rightTxtSize.height);
    }
    
    
    
    
    
    
    
    
    
}
@end
