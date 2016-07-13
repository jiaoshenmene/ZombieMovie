//
//  NSString+GGUtility.h
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GGUtility)
//- (CGSize) gettxtSize:(NSString *)str;
- (CGSize) gettxtSize:(CGSize)size font:(UIFont *)font;

- (CGSize)sizeWithFontCompatible:(UIFont *)font;


- (CGSize)sizeWithFontCompatible:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;


- (CGSize)sizeWithFontCompatible:(UIFont *)font constrainedToSize:(CGSize)size;


- (CGSize)sizeWithFontCompatible:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
