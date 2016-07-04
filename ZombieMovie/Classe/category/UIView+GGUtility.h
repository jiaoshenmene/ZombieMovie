//
//  UIView+GGUtility.h
//  ZombieMovie
//
//  Created by dujia on 16/7/1.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GGUtility)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

- (void)removeAllSubViews;


@end
