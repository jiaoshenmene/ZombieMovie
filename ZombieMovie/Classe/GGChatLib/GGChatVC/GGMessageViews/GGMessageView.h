//
//  GGMessageView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/7.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGMessageViewDelegate <NSObject>
- (void) sendMethod:(id)sender;


@end

@interface GGMessageView : UIView

@property (nonatomic , weak) id<GGMessageViewDelegate> delegate;

- (NSString *)getsendMessageText;

- (void) clearMesText;

@end
