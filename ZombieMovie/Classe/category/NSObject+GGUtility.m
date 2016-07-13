//
//  NSObject+GGUtility.m
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "NSObject+GGUtility.h"

@implementation NSObject (GGUtility)
- (CGFloat) getCenterPoint:(CGFloat)totalHeight childHeight:(CGFloat)childHeight
{
    return (totalHeight - childHeight) / 2;
}
@end
