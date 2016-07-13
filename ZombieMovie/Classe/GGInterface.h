//
//  GGInterface.h
//  ZombieMovie
//
//  Created by dujia on 16/7/3.
//  Copyright © 2016年 sun. All rights reserved.
//

#ifndef GGInterface_h
#define GGInterface_h


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]



#define GGMainScreenFrame [UIScreen mainScreen ].applicationFrame



#define GGImage(x) [UIImage imageNamed:x]


#endif /* GGInterface_h */
