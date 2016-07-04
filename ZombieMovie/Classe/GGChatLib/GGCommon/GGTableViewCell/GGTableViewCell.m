//
//  GGTableViewCell.m
//  ZombieMovie
//
//  Created by dujia on 16/7/1.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "GGTableViewCell.h"

@implementation GGTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftSeparatorSpace = 15.0f;
        _topLineStyle = GGCellLineStyleNone;
        _bottomLineStyle = GGCellLineStyleDefault;
    }
    return self;
}

- (void)setTopLineStyle:(GGCellLineStyle)topLineStyle
{
    _topLineStyle = topLineStyle;
    [self setNeedsDisplay];
}

- (void)setBottomLineStyle:(GGCellLineStyle)bottomLineStyle
{
    _bottomLineStyle = bottomLineStyle;
    [self setNeedsDisplay];
}

- (void)setLeftSeparatorSpace:(CGFloat)leftSeparatorSpace
{
    _leftSeparatorSpace = leftSeparatorSpace;
    [self setNeedsDisplay];
}

- (void)setRightSeparatorSpace:(CGFloat)rightSeparatorSpace
{
    _rightSeparatorSpace = rightSeparatorSpace;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, BORDER_WIDTH_1PX * 2);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    if (self.topLineStyle != GGCellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.topLineStyle == GGCellLineStyleFill ? 0 : _leftSeparatorSpace);
        CGFloat endX = self.width - self.rightSeparatorSpace;
        CGFloat y = 0;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endX, y);
        CGContextStrokePath(context);
    }
    if (self.bottomLineStyle != GGCellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.bottomLineStyle == GGCellLineStyleFill ? 0 : _leftSeparatorSpace);
        CGFloat endX = self.width - self.rightSeparatorSpace;
        CGFloat y = self.height;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endX, y);
        CGContextStrokePath(context);
    }
}
@end
