//
//  GGMeAttributeModel.h
//  ZombieMovie
//
//  Created by dujia on 16/7/11.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GGUnitType) {
    GGUnitTypeString,
    GGUnitTypeImage,
};

@interface GGMeAttributeModel : NSObject
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSString *numberstring;

@property (nonatomic , assign) GGUnitType type;
@property (nonatomic , strong) NSString *url;


@end
