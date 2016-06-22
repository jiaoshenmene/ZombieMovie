//
//  SGMeHeadView.h
//  ZombieMovie
//
//  Created by dujia on 16/6/21.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGMeData.h"


@protocol SGMeHeadViewDel <NSObject>

- (void)iconMethod:(id)sender;


@end

@interface SGMeHeadView : UITableViewCell

@property (nonatomic , weak) id<SGMeHeadViewDel> delegate;

- (void)setContentData:(SGMeData *)data;

@end
