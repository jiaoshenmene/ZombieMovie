//
//  SGMeMainView.h
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SGMeMainViewDel  <NSObject>

- (void)iconMethod:(id)sender;

- (void)gotoSettingVC;


@end

@interface SGMeMainView : UIView

@property (nonatomic , weak) id<SGMeMainViewDel> delegate;

@end
