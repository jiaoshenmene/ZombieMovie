//
//  GGLoginView.h
//  ZombieMovie
//
//  Created by dujia on 16/6/29.
//  Copyright © 2016年 sun. All rights reserved.
//

@protocol GGLoginViewDelegate <NSObject>

- (void) login:(id)sender username:(NSString *)username password:(NSString *)password;


@end

@interface GGLoginView : UIView

@property (nonatomic , weak) id<GGLoginViewDelegate> delegate;

@end
