//
//  GGMessageBottomView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/8.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGMessageBottomViewDelegate <NSObject>

- (void) sendMethod:(id)sender;


@end


@interface GGMessageBottomView : UIView
@property (nonatomic , weak) id<GGMessageBottomViewDelegate> delegate;
@end
