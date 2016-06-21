//
//  ViewModel.h
//  ZombieMovie
//
//  Created by apple on 16/6/9.
//  Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, strong)NSString * ID;

@property (nonatomic, strong)NSString * city;

@property (nonatomic, strong)NSString * name;

@property (nonatomic, strong)NSString * portrait;

@property (nonatomic, assign)int  online_users;

@property (nonatomic, strong)NSString * url;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
