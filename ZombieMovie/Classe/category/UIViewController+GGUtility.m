//
//  UIViewController+GGUtility.m
//  ZombieMovie
//
//  Created by dujia on 16/6/26.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "UIViewController+GGUtility.h"

@implementation UIViewController (GGUtility)

- (void)hideTabBarController:(BOOL)isHide
{
    if (isHide) {
        
        [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
            

            for(UIView *view in self.tabBarController.view.subviews)
            {
                NSLog(@"%@",[view class]);
                if([view isKindOfClass:[UITabBar class]])
                {
                    [view setFrame:CGRectMake(view.frame.origin.x,
                                              view.frame.origin.y + 50,
                                              view.frame.size.width,
                                              view.frame.size.height)];
                }
                else
                {
                    [view setFrame:CGRectMake(view.frame.origin.x,
                                              view.frame.origin.y,
                                              view.frame.size.width,
                                              view.frame.size.height + 50)];
                }
            }
        }];
    }else{
        // 显示tabbar
        [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
            for(UIView *view in self.tabBarController.view.subviews)
            {
                if([view isKindOfClass:[UITabBar class]])
                {
                    NSLog(@"%f\n%f\n%f",self.view.frame.size.height,view.frame.origin.y - 50,view.frame.size.height);
                    [view setFrame:CGRectMake(view.frame.origin.x,
                                              view.frame.origin.y - 50,
                                              view.frame.size.width,
                                              view.frame.size.height)];
                }
                else
                {
                    [view setFrame:CGRectMake(view.frame.origin.x,
                                              view.frame.origin.y,
                                              view.frame.size.width,
                                              view.frame.size.height - 50)];
                }
            }
        }];
    }
    
}

@end
