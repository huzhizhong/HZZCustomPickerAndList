//
//  TitleScrollHelper.h
//  titleScrollViewTest
//
//  Created by tgjr-Hzz on 2017/5/23.
//  Copyright © 2017年 Hzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define mainTextColor [UIColor blackColor]
#define selectedColor [UIColor blackColor]
#define titleFont [UIFont systemFontOfSize:14]
@interface TitleScrollHelper : NSObject
//计算间隔
+(CGFloat)caculateSpaceByTitleArray:(NSArray *)titleArray rect:(CGRect)rect;
//计算标题大小
+(CGSize)titleSize:(NSString *)title height:(CGFloat)height;
@end
