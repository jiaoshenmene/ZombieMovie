//
//  GGTableViewCell.h
//  ZombieMovie
//
//  Created by dujia on 16/7/1.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GGCellLineStyle) {
    GGCellLineStyleNone,
    GGCellLineStyleDefault,
    GGCellLineStyleFill,
};


@interface GGTableViewCell : UITableViewCell
/**
 *  左边距
 */
@property (nonatomic, assign) CGFloat leftSeparatorSpace;

/**
 *  右边距，默认0，要修改只能直接指定
 */
@property (nonatomic, assign) CGFloat rightSeparatorSpace;

@property (nonatomic, assign) GGCellLineStyle topLineStyle;
@property (nonatomic, assign) GGCellLineStyle bottomLineStyle;

@end
