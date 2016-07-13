//
//  GGMeInfoFrame.h
//  ZombieMovie
//
//  Created by dujia on 16/7/12.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GGMeInfoData.h"


@interface GGMeInfoFrame : NSObject

@property (nonatomic , assign) CGRect titleF;

@property (nonatomic , assign) CGFloat cellHeight;

@property (nonatomic , assign) CGRect rightImageF;

@property (nonatomic , assign) CGRect rightTxtF;

@property (nonatomic , strong) GGMeInfoData *infodata;

@property (nonatomic , strong) UIFont *titleFont;

@property (nonatomic , strong) UIImage *rightImage;

- (instancetype) initWithData:(GGMeInfoData *)infodata;

@end
