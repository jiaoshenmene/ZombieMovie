//
//  NSString+GGUtility.m
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "NSString+GGUtility.h"

@implementation NSString (GGUtility)
- (CGSize) gettxtSize:(NSString *)str
{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;;
    return textSize;
}
@end
