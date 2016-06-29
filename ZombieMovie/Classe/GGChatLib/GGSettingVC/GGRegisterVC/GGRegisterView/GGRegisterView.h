//
//  GGRegisterView.h
//  GGChat
//
//  Created by dujia on 16/6/28.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGRegisterViewDelegate <NSObject>

- (void) registerSubmite:(id)sender username:(NSString *)username password:(NSString *)password;


@end

@interface GGRegisterView : UIView
@property (nonatomic , weak) id<GGRegisterViewDelegate> delegate;
@end
