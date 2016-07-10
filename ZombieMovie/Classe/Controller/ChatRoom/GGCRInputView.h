//
//  GGCRInputView.h
//  ZombieMovie
//
//  Created by dujia on 16/7/10.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGCRInputViewDelegate <NSObject>

- (void) sendMethod:(id)sender;

@end

typedef void(^SendMethod)(id sender);

@interface GGCRInputView : UIView

@property (nonatomic , strong) UITextField *inputTextField;


@property (nonatomic , weak) id<GGCRInputViewDelegate> delegate;

@property (nonatomic , copy) SendMethod sendMethod;

@end
