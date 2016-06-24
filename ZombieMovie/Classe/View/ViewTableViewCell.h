//
//  ViewTableViewCell.h
//  ZombieMovie
//
//  Created by apple on 16/6/8.
// Copyright © 2016年 一位97年的iOS开发者,喜欢学习新知识(姿势😄),如果你和我有相同爱好就加我🐧:450002197,记得备注iOS开发者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@class SGLookLiveModel;


@interface ViewTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView * iconImage;// 用户头像

@property (nonatomic, strong)UILabel * nameLabel;// 用户姓名

@property (nonatomic, strong)UIButton * address;// 用户地址

@property (nonatomic, strong)UILabel *peopleNumber;// 观看人数

@property (nonatomic, strong)UIImageView * coverImage;// 封面

@property (nonatomic , strong) SGLookLiveModel *sgllModel;

@property (nonatomic, strong)ViewModel * viewModel;
@end
