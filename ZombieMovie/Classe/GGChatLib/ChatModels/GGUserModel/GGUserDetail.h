//
//  GGUserDetail.h
//  ZombieMovie
//
//  Created by dujia on 16/6/30.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGUserDetail : NSObject
@property (nonatomic, strong) NSString *userID;

@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString *location;

@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *qqNumber;

@property (nonatomic, strong) NSString *email;

@property (nonatomic, strong) NSArray *albumArray;

@property (nonatomic, strong) NSString *motto;

@property (nonatomic, strong) NSString *momentsWallURL;


/// 备注信息
@property (nonatomic, strong) NSString *remarkInfo;

/// 备注图片（本地地址）
@property (nonatomic, strong) NSString *remarkImagePath;

/// 备注图片 (URL)
@property (nonatomic, strong) NSString *remarkImageURL;

/// 标签
@property (nonatomic, strong) NSMutableArray *tags;
@end
